package com.kongcepts.crudoperations.service;

import com.kongcepts.crudoperations.entity.Store;
import com.kongcepts.crudoperations.repository.StoreRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class StoreService {

    @Autowired
    private StoreRepository repository;

    // Saving single object
    public Store saveStore(Store store){
       return repository.save(store);
    }
    // saving a list of obj
    public List<Store> saveStores(List<Store> stores){
        return repository.saveAll(stores);
    }

    // shows all available in DB
    public List<Store> getStores(){
        return repository.findAll();
    }

    // Finding by Id
    public Store getStoreById (int tbl_store_id){
        return repository.findById(tbl_store_id).orElse(null);
    }

    //FINDING BY NAME
    public Store getStoreByName (String tbl_store_name){
        return repository.findByName(tbl_store_name);
    }

    //Deleting Method
    public String deleteStore(int tbl_store_id){
        repository.deleteById(tbl_store_id);
        return "Successfully Deleted..." +tbl_store_id;
    }

    //Updating Method
    public Store updateStore(Store store){
        Store existitingStore=repository.findById(store.getTbl_store_id()).orElse(null);
        existitingStore.setTbl_store_name(store.getTbl_store_name());
        return repository.save(existitingStore);

    }
}
