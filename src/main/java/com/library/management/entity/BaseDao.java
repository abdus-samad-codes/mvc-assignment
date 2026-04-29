package com.library.management.entity;

import com.library.management.util.DateUtil;
import jakarta.persistence.MappedSuperclass;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;

@MappedSuperclass
public class BaseDao {
    //db track info
    long createdAt;
    long updatedAt;

    @PrePersist
    public void onCreate() {
        createdAt = DateUtil.getCurrentTimeInUTC();
        updatedAt = DateUtil.getCurrentTimeInUTC();
    }

    @PreUpdate
    public void onUpdate() {
        updatedAt = DateUtil.getCurrentTimeInUTC();
    }

}
