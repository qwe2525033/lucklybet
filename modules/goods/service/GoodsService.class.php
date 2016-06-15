<?php

/**
 * 
 * @author blueyb.java@gmail.com
 */
class GoodsService extends TransationSupport implements IGoodsService{
	
	private function randomFloat($min = 0, $max = 1) {  
    	return $min + mt_rand() / mt_getrandmax() * ($max - $min);  
	} 
	
	/**
	 * @see IGoodsService::lottery()
	 */
	public function lottery(User $user, $goods){
		$probability = $goods['probability'];
		if($probability >= 1) return true;
		//生成0-1之间的浮点小数
		$rand = $this->randomFloat();
		return $probability >= $rand;
	}
	
	/**
	 * @see IGoodsService::exchange()
	 */
	public function exchange(User $user, $goods, $exchange){
		if(!$user || !$goods || !$exchange) return false;
		if(!$goods['can_exchange'] || $goods['count'] <= 0){
			return false;
		}
		if($user->getAvailableBtc() < $goods['btc'] || $user->getAvailableBtc() < $goods['btc_limit']){
			return false;
		}
	
		$goodsLink = NoticeService::makeGoodsLink(array('id'=>$goods['id'], 'title'=>$goods['title']));
		try{
			$this->beginTransation();
			//扣除金额
			$io = array(
					'from_user_id'=>$user->getId(),
					'to_user_id'=>0,
					'from_title'=>"兑换商品{$goodsLink}",
					'wealth_type'=>Io::WEALTH_TYPE_MONEY,
					'wealth'=>$goods['btc'],
					'from_balance'=>$user->getAvailableBtc() - $goods['btc']
					);
			$userService = MemberServiceFactory::getUserService();
			if(!$userService->btc($io)){
				$this->rollBack();
				return false;
			}
			//兑换
			$exchangeDao = MD("Exchange");
			if(!$exchangeDao->add($exchange)){
				$this->rollBack();
				return false;
			}
			//更新商品库存
			$goodsDao = MD('Goods');
			if(!$goodsDao->update(array('count'=>'count - 1'), $goods['id'], true)){
				$this->rollBack();
				return false;
			}
			$this->commit();
			return true;
		}catch(Exception $exception){
			$this->rollBack();
			return false;
		}
		return true;
	}
}

?>