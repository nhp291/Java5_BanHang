package com.asm.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.asm.bean.Account;


@Repository
public interface AccountRepo extends JpaRepository<Account, String>{
	@Query("SELECT a FROM Account a WHERE a.fullname LIKE :name")
	List<Account> findByFullname(@Param("name") String fullname);
	@Query("SELECT a FROM Account a WHERE a.username LIKE :username")
	List<Account> findByUsernameLike(@Param("username") String username);
	@Query("SELECT COUNT(a) FROM Account a, RoleDetail rd WHERE a.username = rd.account.username AND rd.role.role = :role")
	Long countCustomer(@Param("role") String role);

}
