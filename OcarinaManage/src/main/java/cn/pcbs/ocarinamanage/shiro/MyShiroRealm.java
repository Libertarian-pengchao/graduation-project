package cn.pcbs.ocarinamanage.shiro;

import java.util.HashSet;
import java.util.Set;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;

import cn.pcbs.ocarinamanage.model.Permission;
import cn.pcbs.ocarinamanage.model.Post;
import cn.pcbs.ocarinamanage.model.Role;
import cn.pcbs.ocarinamanage.model.User;
import cn.pcbs.ocarinamanage.service.UserService;

public class MyShiroRealm extends AuthorizingRealm{

	@Autowired
	private UserService userService;
	/**
	 * 实现授权认证
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principal) {
		User user = (User) principal.getPrimaryPrincipal();
		
		SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
		Set<String> roles = new HashSet<>();
		Set<String> permissions = new HashSet<>();
		for(Role role : user.getRoles()) {
			roles.add(role.getCode());
			for(Permission p : role.getPermissions()) {
				permissions.add(p.getPname());
			}
		}
		Set<String> newPermissions = new HashSet<>();
		for(String per:permissions) {
			if(per.contains("p:")) {
				newPermissions.add(per.replaceAll("p:", ""));
			}else {
				newPermissions.add(per);
			}
		}
		info.setRoles(roles);
		info.setStringPermissions(newPermissions);
		return info;
	}

	/**
	 * 实现登录认证
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		UsernamePasswordToken token1 = (UsernamePasswordToken) token;
		String username = token1.getUsername();
		User user = userService.getUserByUsername(username);
		if(user == null) {
			throw new UnknownAccountException("此用户不存在!");
		}
		if(user.getState() == 0) {
			throw new LockedAccountException("此用户已被禁用!");
		}
		Set<Role> roles = user.getRoles();
		for(Role role : roles) {
			if(role.getCode().equals("user")) {
				throw new UnknownAccountException("你没有权限登录该系统!");
			}
		}
		//ByteSource salt = ByteSource.Util.bytes(username);
		AuthenticationInfo info = new SimpleAuthenticationInfo(user, user.getPassword(), null,getName());
		return info;
	}
	
	public static void main(String[] args) {
		//e10adc3949ba59abbe56e057f20f883e
		SimpleHash hash = new SimpleHash("MD5", "e10adc3949ba59abbe56e057f20f883e", null, 1024);
		System.out.println(hash.toString());
	}

}
