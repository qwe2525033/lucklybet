<?php

/**
 * 竞猜参与
 * @author blueyb.java@gmail.com
 */
class PlayAction extends UserCenterAction
{

    public function fixed(HttpRequest $request) {
        $playId = $request->getParameter('id');
        $addPlayWealth = $request->getParameter('value');
        $play_way_id = $request->getParameter('play_way_id');

        if ( $addPlayWealth <= 0 ) {
            AjaxResult::result(0, '添加投注额度需要大于0');
        }

        $guessService = GuessServiceFactory::getGuessService();
        $playService = GuessServiceFactory::getPlayService();

        $play = $playService->get($playId);
        $guess = $guessService->get($play->getGuessId());
        $play->setGuess($guess);
        $play->setUser($this->user);

        if ($play->getUserId() != $this->user->getId()) {
            AjaxResult::result(0, '当前用户不存在');
        }

        $wealthType = $play->getWealthType();
        if ($wealthType == 1 && $addPlayWealth > $this->user->getAvailableBtc()) {
            AjaxResult::result(0, '你的莱特币不够，请先充值');
        }
        $play->setWealth( $play->getWealth() + $addPlayWealth);
        $success = $playService->update($play, $addPlayWealth, $play_way_id);

        if ($success) {
            AjaxResult::result(1, '加注成功');
        } else {
            AjaxResult::result(0, '加注失败');
        }
    }

    public function index(HttpRequest $request)
    {
        $guessService = GuessServiceFactory::getGuessService();
        
        $agree = $request->getParameter('agree');
        if (! $agree) {
            show_message('请先同意OK竞猜竞猜平台声明!');
        }
        $guessId = $request->getParameter('id');
        $guess = $guessService->get($guessId);
        if (! $guess || ! $guess->isPlaying()) {
            show_message('竞猜时间已截止!');
        }
        if ($guess->getCustom()) {
            show_message('非法操作');
        }
        if ($guess->getPlayRole()) {
            // 只有好友才能参与
            // $followService = MemberServiceFactory::getFollowService();
            // $follow = $followService->isFollow($guess->getUserId(), $this->user->getId());
            $userService = MemberServiceFactory::getUserService();
            $follow = $userService->is_friend($guess->getUserId(), $this->user->getId());
            if (! $follow) {
                show_message('该竞猜只对好友开放!');
            }
        }
        
        // 收集竞猜数据
        $play = new Play();
        $play->setGuess($guess);
        $play->setGuessId($guessId);
        $play->setUserId($this->user->getId());
        $play->setUser($this->user);
        $play->setWealthType($guess->getWealthType());
        $play->setCustom(0);
        $playData = null;
        $playParams = $request->getParameter('play');
        // var_dump($playParams);
        foreach ($guess->getPlayDatas() as $playWayData) {
            $playData = new PlayData();
            $playData->setWealth($playParams[$playWayData->getId()]['wealth']);
            $playData->setChoose($playParams[$playWayData->getId()]['value']);
            if ($playData->isPlay()) {
                $playData->setOddsType($playWayData->getOddsType());
                $playData->setPlayWayId($playWayData->getId());
                $playData->setPlayWayName($playWayData->getName());
                $play->addPlayData($playData);
            }
        }
        // var_dump($play);
        // 获取该用户的投注数据
        $playService = GuessServiceFactory::getPlayService();
        $oldPlay = $playService->getUserPlay($this->user->getId(), $guessId);
        if (! $oldPlay) {
            // 添加竞猜
            if ($play->isEmpty()) {
                show_message('请先投注后再提交!');
            }
            
            $wealthType = $play->getWealthType();
            $playWealth = $play->getPlayWealth();
            if ($wealthType == 1 && $playWealth > $this->user->getAvailableBtc()) {
                show_message('你的莱特币不够，请先充值');
            }
            
            if ($wealthType == 2 && $playWealth > $this->user->getAvailableIntegral()) {
                show_message('你的积分不够，请先充值');
            }
            
            $play->setWealth($playWealth);
            $play->setCreateTime($request->getRequestTime());
            if ($playService->add($play)) {
                AjaxResult::refreshPage("投注成功，正在刷新页面...");
            } else {
                show_message('投注失败');
            }
        } else {
            // 修改竞猜
            $play->setCreateTime($oldPlay);
        }
    }

    /**
     * 自定义竞猜
     *
     * @param HttpRequest $request            
     */
    public function custom(HttpRequest $request)
    {
        $guessService = GuessServiceFactory::getCustomGuessService();
        
        $agree = $request->getParameter('agree');
        if (! $agree) {
            show_message('请先同意OK竞猜竞猜平台声明!');
        }
        $guessId = $request->getParameter('id');
        $guess = $guessService->get($guessId);
        if (! $guess || ! $guess->isPlaying()) {
            show_message('竞猜时间已截止!');
        }
        if (! $guess->getCustom()) {
            show_message('非法操作');
        }
        if ($guess->getPlayRole()) {
            // 只有好友才能参与
            $followService = MemberServiceFactory::getFollowService();
            $follow = $followService->isFollow($guess->getUserId(), $this->user->getId());
            if (! $follow) {
                show_message('该竞猜只对好友开放!');
            }
        }
        
        // 收集竞猜数据
        $play = new Play();
        $play->setGuess($guess);
        $play->setGuessId($guessId);
        $play->setUserId($this->user->getId());
        $play->setUser($this->user);
        $play->setWealthType(Guess::WEALTH_TYPE_EDPF);
        $play->setCustom(1);
        $choose = $request->getParameter($guess->getParameter()
            ->getName());
        if (! isset($choose)) {
            show_message('请先投注后再提交!');
        }
        $playData = new PlayData();
        $playData->setWealth(Guess::WEALTH_TYPE_EDPF);
        $playData->setChoose($choose);
        $play->addPlayData($playData);
        
        // 获取该用户的投注数据
        $playService = GuessServiceFactory::getCustomPlayService();
        $oldPlay = $playService->getUserPlay($this->user->getId(), $guessId);
        if (! $oldPlay) {
            // 添加竞猜
            if ($play->isEmpty()) {
                show_message('请先投注后再提交!');
            }
            $play->setCreateTime($request->getRequestTime());
            if ($playService->add($play)) {
                AjaxResult::refreshPage("投注成功，正在刷新页面...");
            } else {
                show_message('投注失败');
            }
        } else {
            // 修改竞猜
            $play->setCreateTime($oldPlay);
        }
    }
}