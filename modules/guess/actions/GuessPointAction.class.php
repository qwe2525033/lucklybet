<?php

/**
 * 竞猜点
 * @author blueyb.java@gmail.com
 */
class GuessPointAction extends UserCenterAction
{

    /**
     * 获取小分类里的竞猜点
     * 
     * @param HttpRequest $request            
     */
    public function ajaxgets(HttpRequest $request)
    {
        $cateId = intval($request->getParameter('cateId'));
        if (! $cateId) {
            AjaxResult::ajaxResult(1, null);
        }
        $conditions = "`cate_id`='{$cateId}' and `status`='1' and `play_deadline` > '{$request->getRequestTime()}'";
        $guessPoints = MD('GuessPoint')->gets($conditions);
        AjaxResult::ajaxResult('1', $guessPoints);
    }

    public function add(HttpRequest $request)
    {
        $paramsHtml = array();
        $parameterCount = 0;
        $cateId = intval($request->getParameter('cateId'));
        $guessCategoryDao = MD('GuessCategory');
        $guessCategoryInfo = $guessCategoryDao->get($cateId);
        if (! empty($guessCategoryInfo)) {
            $parameterCount = $guessCategoryInfo['parameter_count'];
        }
        if ($parameterCount > 0) {
            for ($i = 0; $i < $parameterCount; $i ++) {
                $index = $i + 1;
                $paramsHtml[] = '<li>参数' . $index . ': <input name="params[]" class="txt" value=""/></li>';
            }
        }
        $request->assign('cateId', $cateId);
        $request->assign('paramsHtml', implode('', $paramsHtml));
        $this->setView('guess_add_point');
    }

    /**
     * 添加模型，只能处理单表，如果有文件上传，请先上传文件，并设置值到请求参数中
     * 
     * @param HttpRequest $request            
     */
    public function insert(HttpRequest $request)
    {
        $this->beforeInsert($request);
        $model = $this->createModelByAction();
        $model->fillPostDatas(); // 收集与m_开头的数据
        $modelDao = MD($model);
        $success = $modelDao->add($model);
        $redirectInfo = $request->getAttribute('redirectInfo');
        if ($success) {
            // 操作成功
            show_message('竞猜点添加成功...');
        } else {
            // 操作失败
            show_message('竞猜点添加失败');
        }
    }

    /*
     * @see AbstractAdminAction::insert()
     */
    public function beforeInsert(HttpRequest $request)
    {
        // 检测参数是否为空
        $title = $request->getParameter('m_title'); // 标题
        $cate_id = $request->getParameter('m_cate_id'); // 竞猜点小分类id
                                                        // 检测同一分类下面标题是否重复
        $model = $this->createModelByAction();
        $modelDao = MD($model);
        // $conditions = array('cate_id'=>$cate_id,'title'=>$title);
        $conditions = " `cate_id`='{$cate_id}' And `status`='1' And `play_deadline` > '{$request->getRequestTime()}' And `title` = '{$title}' ";
        $guessRow = $modelDao->getOne($conditions, 'id');
        if (! empty($guessRow)) {
            show_message('竞猜点已经存在');
        }
        $playDeadline = $request->getParameter('m_play_deadline'); // 截止参与时间
        if (empty($title)) {
            show_message('竞猜点标题不能为空');
        }
        if (empty($playDeadline)) {
            show_message('参与截止时间不能为空');
        }
        // 处理参数
        $inputParams = $request->getParameter('params');
        $params = array();
        foreach ($inputParams as $name => $label) {
            $label = trim($label);
            if ($label) {
                $param = new PlayWayParameter();
                $param->setName($name);
                $param->setLabel($label);
                $params[$name] = $param;
            }
        }
        $paramCount = count($params);
        $category = MD('GuessCategory')->get($request->getParameter('m_cate_id'));
        if ($paramCount != $category['parameter_count']) {
            show_message('该竞猜点参数个数和分类要求的参数个数不同，请先确认!');
        }
        if ($params) {
            $request->setParameter('m_params', serialize($params));
        }
        $request->setParameter('m_create_time', $request->getRequestTime());
        $playDeadline = $request->getParameter('m_play_deadline');
        if ($playDeadline) {
            $playDeadline = strtotime($playDeadline);
            $request->setParameter('m_play_deadline', $playDeadline);
        }
    }

    /**
     * 发布者判定竞猜结果
     * 
     * @return Model
     */
    public function result(HttpRequest $request)
    {
        $id = $request->getParameter('id');
        if (empty($id)) {
            show_message('竞猜结果判定失败');
        }
        $guessService = GuessServiceFactory::getGuessService();
        $guess = $guessService->get($id);
        if (! $guess) {
            show_message('竞猜结果判定失败');
        }
        $guessPointId = $guess->getGuessPointId();
        $guessPoint = $guessService->getGuessPoint($guessPointId);
        if (! $guessPoint) {
            show_message('竞猜点不存在');
        }
        if (! $guessPoint->getParams()) {
            show_message('该竞猜点没有参数，不能进行结果判定!');
        }
        $request->setAttribute('item', $guessPoint);
        $request->setAttribute('guess', $guess);
        if (! $request->isPost()) {
            $this->setView('guess_result_point');
        } else {
            foreach ($guessPoint->getParams() as $param) {
                $param->setValue(trim($request->getParameter($param->getName())));
            }
            $guessDao = MD('Guess');
            $success = $guessDao->update(array(
                'parameter' => serialize($guessPoint->getParams())
            ), $id);
            // $guessPointDao = MD('GuessPoint');
            // $success = $guessPointDao->update(array('params'=>serialize($guessPoint->getParams())), $id);
            if ($success) {
                $success = $guessService->guessPointRudge($guessPoint, $id);
                if ($success) {
                    // 操作成功
                    show_message('竞猜结果判定成功...');
                } else {
                    // 操作失败
                    show_message('竞猜结果判定失败');
                }
            } else {
                // 操作失败
                show_message('竞猜结果判定失败');
            }
        }
    }

    /**
     * 根据后台Action创建动态模型
     * 
     * @return Model
     */
    protected function createModelByAction()
    {
        $modelName = $this->getActionName();
        return M($modelName);
    }

    /**
     * 获取Action名称
     * 
     * @return string
     */
    private function getActionName()
    {
        $request = R::getRequest();
        $actionMapping = $request->getAction()->getActionMapping();
        $actionName = $actionMapping->getAction();
        return $actionName;
    }

    protected function setMessage($message)
    {
        $message = get_lang($message);
        setcookie('message', $message, 0, '/');
        $_COOKIE['message'] = $message;
    }
}