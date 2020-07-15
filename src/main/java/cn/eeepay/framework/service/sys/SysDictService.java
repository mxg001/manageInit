package cn.eeepay.framework.service.sys;

import cn.eeepay.framework.db.pagination.Page;
import cn.eeepay.framework.model.sys.SysDict;
import com.alibaba.fastjson.JSONObject;
import org.quartz.SchedulerException;

import java.util.List;
import java.util.Map;

public interface SysDictService {

	List<SysDict> selectDicByCondition(SysDict dict, Page<SysDict> page);

	Map<String, Object> insert(SysDict info);

	Map<String, Object> update(SysDict info) throws SchedulerException;

	int delete(Integer id);

	JSONObject selectDictAndChildren();

	SysDict getByKey(String string);
	
	SysDict selectExistServiceLink(String serviceType, String string);

	SysDict selectRestPwd();

	List<SysDict> selectByKey(String string);

	int updateSysValue(SysDict sysDict);

	Map<String, String> selectMapByKey(String string);
	
	String getValues(String parentId);

	List<SysDict> getAcqMerchantList(String str);
}
