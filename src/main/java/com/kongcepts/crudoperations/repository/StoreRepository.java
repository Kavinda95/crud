package com.kongcepts.crudoperations.repository;

import com.kongcepts.crudoperations.entity.Store;
import org.springframework.data.jpa.repository.JpaRepository;

public interface StoreRepository extends JpaRepository<Store, Integer> {
    Store findByName(String tbl_store_name);
}
