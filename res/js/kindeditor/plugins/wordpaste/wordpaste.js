<?php

class Tree {
	var $data = array();
	var $child = array();
	var $layer = array();
	var $parent = array();
	var $countid = 0;

	function setNode($id, $parent, $value) {

		$parent = $parent?$parent:0;

		$this->data[$id] = $value;
		$this->child[$parent][]  = $id;
		$this->parent[$id] = $parent;

		if(!isset($this->layer[$parent])) {
			$this->layer[$id] = 0;
		} else {
			$this->layer[$id] = $this->layer[$parent] + 1;
		}
	}

	function getList(&$tree, $root= 0) {
		foreach($this->child[$root] as $key => $id) {
			$tree[] = $id;
			if(!empty($this->child[$id])) $this->getList($tree, $id);
		}
	}

	function getValue($id) {
		return $this->data[$id];
	}

	function reSetLayer($id) {
		if($this->parent[$id]) {
			$this->layer[$this->countid] = $this->layer[$this->countid] + 1;
			$this->reSetLayer($this->parent[$id]);
		}
	}

	function getLayer($id, $space = false) {
		//重新计算级数
		$this->layer[$id] = 0;
		$this->countid = $id;
		$this->reSetLayer($id);
		$result = '';
		if($space) $result = str_repeat($space, $this->layer[$id]);
		else $result = $this->layer[$id];
		return $result;
	}

	function getParent($id) {
		return $this->parent[$id];
	}

	function getParents($id) {
		while($this->parent[$id] != 0) {
			$id = $parent[$this->layer[$id]] = $this->parent[$id];
		}

		ksort($parent);	//按照键名排序
		reset($parent); //数组指针移回第一个单元

		return $parent;
	}

	function getChild($id) {
		return $this->child[$id];
	}

	function getChilds($id = 0) {
		$child = array();
		$this->getList($child, $id);

		return $child;
	}
}

?>