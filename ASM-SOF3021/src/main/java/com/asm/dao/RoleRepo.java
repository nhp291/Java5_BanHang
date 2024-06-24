package com.asm.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.asm.bean.Role;


@Repository
public interface RoleRepo extends JpaRepository<Role, String>{

}
