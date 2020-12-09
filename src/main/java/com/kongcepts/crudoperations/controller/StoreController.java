package com.kongcepts.crudoperations.controller;

import com.kongcepts.crudoperations.entity.Store;
import com.kongcepts.crudoperations.service.StoreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@RestController
public class StoreController {

    @Autowired
    private StoreService service;

    @PostMapping("/add")
    public Store addStore(@RequestBody Store store){
        return service.saveStore(store);
    }
    @PostMapping("/addmore")
    public List<Store> addStore(@RequestBody List<Store> stores){
        return service.saveStores(stores);
    }
    @GetMapping("/getstore")
    public List<Store> findAllStores(){
        return service.getStores();
    }
    @GetMapping("/getstore/{tbl_store_id}")
    public Store findStoreById(@PathVariable int tbl_store_id){
        return service.getStoreById(tbl_store_id);
    }
    @GetMapping("/getstore/{tbl_store_name}")
    public Store findStoreByName(@PathVariable String tbl_store_name){
        return service.getStoreByName(tbl_store_name);
    }
    @PutMapping("/update")
    public Store updateStore(@RequestBody Store store) {
        return service.updateStore(store);
    }
    @DeleteMapping("/delete")
    public String deleteStore(@PathVariable int tbl_store_id){
        return service.deleteStore(tbl_store_id);
    }
}
