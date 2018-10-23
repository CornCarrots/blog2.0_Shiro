package com.lh.service.impl;

import com.lh.bean.Article;
import com.lh.bean.Role;
import com.lh.bean.User;
import com.lh.bean.UserExample;
import com.lh.mapper.UserMapper;
import com.lh.service.ArticleService;
import com.lh.service.RoleService;
import com.lh.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    UserMapper userMapper;
    @Autowired
    ArticleService articleService;
    @Autowired
    RoleService roleService;

    @Override
//    @CacheEvict(value = "CacheUser",allEntries = true)
    public void add(User user) {
        userMapper.insertSelective(user);
    }

    @Override
    public void delete(int id) {
        userMapper.deleteByPrimaryKey(id);
    }

    @Override
//    @CacheEvict(value = "cacheUser",allEntries = true)
    public void update(User user) {
        userMapper.updateByPrimaryKeySelective(user);
    }

    @Override
//    @Cacheable(value = "cacheUser",key = "'users-'+#p0")
    public User get(int id) {
        return userMapper.selectByPrimaryKey(id);
    }

    @Override
//    @Cacheable(value = "CacheUser",key = "'user-'+#p0")
    public User get(String name, String pass) {
        User user = null;
        for (User user1:
             list()) {
            if (user1.getUserName().equals(name)&&user1.getUserPassword().equals(pass))
            {
                user = user1;
                break;
            }
        }
        return user;
    }

    @Override
    public List<User> list() {
        UserExample example = new UserExample();
        example.setOrderByClause("id desc");
        return userMapper.selectByExample(example);
    }

    @Override
    public void fillUser(User user) {
        List<Article> articles = articleService.listByUser(user.getId());
        List<Role> roles = roleService.listRolesByUser(user);
        user.setArticles(articles);
        user.setRoles(roles);
    }

    @Override
    public void fillUser(List<User> users) {
        for (User user:
             users) {
            fillUser(user);
        }
    }

    @Override
    public boolean isExists(String name) {
        for (User user:
             list()) {
            if(user.getUserName().equals(name))
                return true;
        }
        return false;
    }

    @Override
    public String getPassword(String name) {
        User user = getByName(name);
        if (user==null)
            return null;
        return user.getUserPassword();
    }

    @Override
    public User getByName(String name) {
        UserExample example = new UserExample();
        example.createCriteria().andUserNameEqualTo(name);
        List<User> users = userMapper.selectByExample(example);
        if(users.isEmpty())
            return null;
        return users.get(0);
    }
}
