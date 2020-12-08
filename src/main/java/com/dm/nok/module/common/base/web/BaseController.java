package com.dm.nok.module.common.base.web;

import com.dm.nok.module.common.base.service.ResultVO;

public class BaseController {
	
	public final ResultVO addResult(Object data) {
		return new ResultVO(data);
	}
	
	public final ResultVO addResult(Exception e) {
		return new ResultVO(true, e.getMessage());
	}
}
