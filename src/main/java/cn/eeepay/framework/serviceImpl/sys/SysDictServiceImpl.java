package cn.eeepay.framework.serviceImpl.sys;

import cn.eeepay.boss.quartz.QuartzManager;
import cn.eeepay.boss.quartz.QuartzSimpleManager;
import cn.eeepay.framework.dao.sys.SysDictDao;
import cn.eeepay.framework.db.pagination.Page;
import cn.eeepay.framework.model.sys.SysDict;
import cn.eeepay.framework.service.sys.RedisService;
import cn.eeepay.framework.service.sys.SysDictService;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import org.quartz.SchedulerException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("sysDictService")
@Transactional
public class SysDictServiceImpl implements SysDictService {

	private final Logger log = LoggerFactory.getLogger(SysDictServiceImpl.class);

	@Resource
	private SysDictDao sysDictDao;

	@Resource
	private QuartzSimpleManager quartzSimpleManager;

	@Autowired
	private QuartzManager quartzManager;

	@Resource
	private RedisService redisService;

	@Override
	public List<SysDict> selectDicByCondition(SysDict dict, Page<SysDict> page) {
		return sysDictDao.selectDicByCondition(dict,page);
	}

	@Override
	public Map<String, Object> insert(SysDict info) {
		Map<String, Object> msg = new HashMap<>();
		msg.put("status", false);
		msg.put("msg", "操作失败");
		if(info != null && "BOSS_UNIQUE".equals(info.getParentId())){
			int num = sysDictDao.checkUnique(info);
			if(num>0){
				msg.put("msg", "已存在唯一的数据字典");
				return msg;
			}
		}
		int num = sysDictDao.insert(info);
		if(num > 0){
			msg.put("status", true);
			msg.put("msg", "操作成功");
		}
		return msg;
	}

	@Override
	public Map<String, Object> update(SysDict info) throws SchedulerException {
		Map<String, Object> msg = new HashMap<>();
		msg.put("status", false);
		msg.put("msg", "操作失败");
		if(info != null && "BOSS_UNIQUE".equals(info.getParentId())){
			int num = sysDictDao.checkUnique(info);
			if(num>0){
				msg.put("msg", "已存在唯一的数据字典");
				return msg;
			}
		}
		int num = sysDictDao.update(info);
		if(num > 0){
			msg.put("status", true);
			msg.put("msg", "操作成功");
		}
		return msg;
	}

	@Override
	public int delete(Integer id) {
		return sysDictDao.delete(id);
	}

	@Override
	public JSONObject selectDictAndChildren() {
		List<SysDict> list = sysDictDao.selectAllDict();
		JSONObject json=new JSONObject();
		if(list != null && list.size()>0){
			for(int i=0; i< list.size(); i++){
				SysDict dic=list.get(i);
				JSONArray array=null;
				if(json.containsKey(dic.getSysKey())){
					array=json.getJSONArray(dic.getSysKey());
				}else{
					array=new JSONArray();
					json.put(dic.getSysKey(), array);
				}
				JSONObject item=new JSONObject();
				item.put("text", dic.getSysName());
				if("INT".equals(dic.getType()))
					item.put("value", Integer.parseInt(dic.getSysValue()));
				else
					item.put("value", dic.getSysValue());
				array.add(item);
			}
		}
		return json;
	}

	@Override
	public SysDict getByKey(String string) {
		return sysDictDao.getByKey(string);
	}

	@Override
	public SysDict selectRestPwd() {
		return sysDictDao.selectRestPwd();
	}

	@Override
	public SysDict selectExistServiceLink(String serviceType, String string) {
		return sysDictDao.selectExistServiceLink(serviceType, string);
	}

	@Override
	public List<SysDict> selectByKey(String string) {
		return sysDictDao.selectListByKey(string);
	}

	@Override
	public Map<String, String> selectMapByKey(String key) {
		Map<String, String> sysDictMap = new HashMap<>();
		List<SysDict> sysDictList = sysDictDao.selectListByKey(key);
		if(sysDictList!=null && sysDictList.size()>0){
			for(SysDict sysDict: sysDictList){
				sysDictMap.put(sysDict.getSysValue(), sysDict.getSysName());
			}
		}
		return sysDictMap;
	}


	@Override
	public int updateSysValue(SysDict sysDict) {
		int num = sysDictDao.updateSysValue(sysDict);
		if(num > 1){
			throw new RuntimeException("updateSysValue一次只能修改一个唯一的数据字典");
		}
		return num;
	}

	@Override
	public String getValues(String parentId) {
		List<String> values = sysDictDao.getValueByparent(parentId);
		if(values != null && values.size() > 0){
			StringBuffer result = new StringBuffer();
			for(String value:values){
				result.append("'"+value+"',");
			}
			return result.substring(0, result.length()-1);
		}else
			return "''";
	}

	@Override
	public List<SysDict> getAcqMerchantList(String str) {
		return sysDictDao.getAcqMerchantList(str);
	}


}
