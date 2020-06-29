package cn.pcbs.ocarinamanage.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.pcbs.ocarinamanage.model.Role;
import cn.pcbs.ocarinamanage.service.RoleService;

@Controller
public class RoleController {
	
	@Autowired
	private RoleService roleService;
	
	@ResponseBody
	@RequestMapping(value="/getAllRoles",method=RequestMethod.POST)
	public List<Map<String, String>> getAllRoles(){
		List<Role> roles = roleService.getAllRoles();
		List<Map<String, String>> roleList = new ArrayList<>();
		for(Role role:roles) {
			Map<String, String> roleMap = new HashMap<>();
			roleMap.put("id", role.getId()+"");
			roleMap.put("text", role.getRname());
			roleList.add(roleMap);
		}
		return roleList;
	}
}
