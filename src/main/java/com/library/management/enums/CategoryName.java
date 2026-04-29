package com.library.management.enums;

import lombok.Getter;

@Getter
public enum CategoryName {

    FICTION("Fiction"),
    NON_FICTION("Non-Fiction"),
    SCIENCE("Science"),
    TECHNOLOGY("Technology"),
    HISTORY("History"),
    BIOGRAPHY("Biography"),
    FANTASY("Fantasy"),
    ROMANCE("Romance");

    private final String value;

    CategoryName(String value) {
        this.value = value;
    }

}
