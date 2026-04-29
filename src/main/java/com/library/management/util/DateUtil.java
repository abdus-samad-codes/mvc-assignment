package com.library.management.util;

import java.time.LocalDate;
import java.time.OffsetDateTime;
import java.time.Period;
import java.time.ZoneOffset;

public class DateUtil {

    //Coordinated Universal Time (UTC) global standard time
    public static long getCurrentTimeInUTC() {
        return OffsetDateTime.now(ZoneOffset.UTC).toInstant().toEpochMilli();
    }

    public static long getAge(LocalDate dob) {
        if (dob == null) return 0;
        Period period = Period.between(dob, LocalDate.now());
        return period.getYears();
    }
}