package com.tutorialq.utils;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import java.io.Serializable;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.temporal.ChronoUnit;
import java.time.temporal.TemporalAdjusters;
import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.Stream;

@Component
@Slf4j
public class DateUtils implements Serializable {

    /**
     * Returns output java.util date in MM/dd/yyyy format for any given input date String.
     *
     * @param date
     * @return
     */
    public static Date parseDate(String date) {
        try {
            return new SimpleDateFormat("MM/dd/yyyy").parse(date);
        } catch (ParseException e) {
            log.error("Parse Exception: " + e);
            return null;
        }
    }

    /**
     * Returns output String date in MM/dd/yyyy format for any given input java util date.
     *
     * @param inputDate
     * @return
     */

    public static String parseDate(Date inputDate) {
        try {
            SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
            return sdf.format(inputDate);
        } catch (Exception ex) {
            log.error("Parse Exception: " + ex);
            return null;
        }
    }

    /**
     * Returns java.util weekend date (Sunday) based on the current local date.
     *
     * @return
     */
    public static Date getCurrentTimesheetWeekEndDate() {
        LocalDate lastSunday = LocalDate.now()
                .with(TemporalAdjusters.nextOrSame(DayOfWeek.SUNDAY));
        log.info("lastSunday: " + lastSunday);
        return Date.from(lastSunday.atStartOfDay(ZoneId.systemDefault()).toInstant());
    }

    /**
     * Returns java.time LocalDate weekend date (Sunday) based on the current local date.
     *
     * @return
     */
    public static LocalDate getLocalTimesheetWeekEndDate() {
        log.info("Inside getLocalTimesheetWeekEndDate");
        LocalDate lastSunday = LocalDate.now()
                .with(TemporalAdjusters.nextOrSame(DayOfWeek.SUNDAY));
        log.info("lastSunday: " + lastSunday);
        return lastSunday;
    }

    /**
     * Returns java.util weekend date (Sunday) for a given date.
     *
     * @return
     */
    public static Date getTimesheetWeekStartDate(Date inputDate) {
        log.info("Inside getTimesheetWeekStartDate :: inputDate: " + inputDate);
        if (inputDate != null) {
            LocalDate localDate = inputDate.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
            LocalDate firstMonday = localDate.with(TemporalAdjusters.previousOrSame(DayOfWeek.MONDAY));
            log.info("Inside inputdate not null loop, firstMonday: " + firstMonday);
            return Date.from(firstMonday.atStartOfDay(ZoneId.systemDefault()).toInstant());
        } else {
            log.error("Input date not found. So returning null.");
            return null;
        }
    }

    /**
     * Returns java.time LocalDate weekend date (Sunday) for a given date.
     *
     * @return
     */
    public static LocalDate getLocalTimesheetWeekStartDate(Date inputDate) {
        log.info("Inside getLocalTimesheetWeekStartDate :: inputDate: " + inputDate);
        if (inputDate != null) {
            LocalDate localDate = inputDate.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
            LocalDate firstMonday = localDate.with(TemporalAdjusters.previousOrSame(DayOfWeek.MONDAY));
            log.info("Inside inputDate not null loop, firstMonday: " + firstMonday);
            return firstMonday;
        } else {
            log.error("Input date not found. So returning null.");
            return null;
        }
    }

    /**
     * Returns java.time LocalDate weekend date (Sunday) for a given date by taking in the .
     *
     * @return
     */
    public static LocalDate getLocalTimesheetWeekStartDateByLocalDate(LocalDate inputDate) {
        log.info("Inside getLocalTimesheetWeekStartDate :: inputDate: " + inputDate);
        if (inputDate != null) {
            LocalDate firstMonday = inputDate.with(TemporalAdjusters.previousOrSame(DayOfWeek.MONDAY));
            log.info("Inside inputDate not null loop, firstMonday: " + firstMonday);
            return firstMonday;
        } else {
            log.error("Input date not found. So returning null.");
            return null;
        }
    }

    /**
     * Returns java.util weekend date (Sunday) for a given date.
     *
     * @return
     */
    public static Date getTimesheetWeekEndDate(Date inputDate) {
        log.info("Inside getTimesheetWeekEndDate :: inputDate: " + inputDate);
        if (inputDate != null) {
            LocalDate localDate = inputDate.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
            LocalDate lastSunday = localDate.with(TemporalAdjusters.nextOrSame(DayOfWeek.SUNDAY));
            log.info("Inside input date not null loop, lastSunday: " + lastSunday);
            return Date.from(lastSunday.atStartOfDay(ZoneId.systemDefault()).toInstant());
        } else {
            log.error("Input date not found. So returning null.");
            return null;
        }
    }

    /**
     * Returns java.time LocalDate weekend date (Sunday) for a given date.
     *
     * @return
     */
    public static LocalDate getLocalTimesheetWeekEndDate(Date inputDate) {
        log.info("Inside getLocalTimesheetWeekEndDate :: inputDate: " + inputDate);
        if (inputDate != null) {
            LocalDate localDate = inputDate.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
            log.info("localDate: " + inputDate);
            LocalDate lastSunday = localDate.with(TemporalAdjusters.nextOrSame(DayOfWeek.SUNDAY));
            log.info("Inside inputDate not null loop, lastSunday: " + lastSunday);
            return lastSunday;
        } else {
            log.error("Input date not found. So returning null.");
            return null;
        }
    }

    /**
     * Returns java.time LocalDate weekend date (Sunday) for a given local date.
     *
     * @return
     */
    public static LocalDate getLocalTimesheetWeekEndDateByLocalDate(LocalDate inputDate) {
        log.info("Inside getLocalTimesheetWeekEndDate :: inputDate: " + inputDate);
        if (inputDate != null) {
            LocalDate lastSunday = inputDate.with(TemporalAdjusters.nextOrSame(DayOfWeek.SUNDAY));
            log.info("Inside inputDate not null loop, lastSunday: " + lastSunday);
            return lastSunday;
        } else {
            log.error("Input date not found. So returning null.");
            return null;
        }
    }

    /**
     * Returns list of LocaDate for end of timesheet week for last three months from current weekend Date.
     *
     * @return
     */
    public static List<Date> getListWeekEndDatesOfLastThreeMonths() {
        log.info("Inside getListEndDatesOfLastThreeMonths method of DateUtils.");
        LocalDate lastSunday = LocalDate.now()
                .with(TemporalAdjusters.nextOrSame(DayOfWeek.SUNDAY));
        log.info("lastSunday: " + lastSunday);
        long weeks = ChronoUnit.WEEKS.between(lastSunday.minusMonths(3L), lastSunday);
        log.info("Number of weeks in last three months: " + weeks);
        List<Date> collect = Stream.iterate(lastSunday.minusWeeks(weeks), d -> d.plusWeeks(1L))
                .limit(weeks + 1)
                .map(d -> Date.from(d.atStartOfDay(ZoneId.systemDefault()).toInstant()))
                .collect(Collectors.toList());
        return collect;
    }

    /**
     * Returns list of java util end of timesheet week Dates for last three months from current weekend Date.
     *
     * @return
     */
    public static List<LocalDate> getListLocalWeekEndDatesOfLastThreeMonths() {
        log.info("Inside getListLocalEndDatesOfLastThreeMonths method of DateUtils.");
        LocalDate lastSunday = LocalDate.now()
                .with(TemporalAdjusters.nextOrSame(DayOfWeek.SUNDAY));
        log.info("lastSunday: " + lastSunday);
        long weeks = ChronoUnit.WEEKS.between(lastSunday.minusMonths(3L), lastSunday);
        log.info("Number of weeks in last three months: " + weeks);
        List<LocalDate> collect = Stream.iterate(lastSunday.minusWeeks(weeks), d -> d.plusWeeks(1L))
                .limit(weeks + 1)
                .collect(Collectors.toList());
        return collect;
    }

    /**
     * Returns list of LocaDate for start of timesheet week Dates for last three months from current week.
     *
     * @return
     */
    public static List<Date> getListWeekStartDatesOfLastThreeMonths() {
        log.info("Inside getListWeekStartDatesOfLastThreeMonths method of DateUtils.");
        LocalDate startMonday = LocalDate.now()
                .with(TemporalAdjusters.previousOrSame(DayOfWeek.MONDAY));
        long weeks = ChronoUnit.WEEKS.between(startMonday.minusMonths(3L), startMonday);
        log.info("Number of weeks in last three months: " + weeks);
        List<Date> collect = Stream.iterate(startMonday.minusWeeks(weeks), d -> d.plusWeeks(1L))
                .limit(weeks + 1)
                .map(d -> Date.from(d.atStartOfDay(ZoneId.systemDefault()).toInstant()))
                .collect(Collectors.toList());
        return collect;
    }

    /**
     * Returns list of java util start of timesheet week Dates for last three months from current week.
     *
     * @return
     */
    public static List<LocalDate> getListLocalStartDatesOfLastThreeMonths() {
        log.info("Inside getListLocalStartDatesOfLastThreeMonths method of DateUtils.");
        LocalDate startMonday = LocalDate.now()
                .with(TemporalAdjusters.previousOrSame(DayOfWeek.SUNDAY));
        long weeks = ChronoUnit.WEEKS.between(startMonday.minusMonths(3L), startMonday);
        log.info("Number of weeks in last three months: " + weeks);
        List<LocalDate> collect = Stream.iterate(startMonday.minusWeeks(weeks), d -> d.plusWeeks(1L))
                .limit(weeks + 1)
                .collect(Collectors.toList());
        return collect;
    }

    /**
     * Return String with appending StartDate and EndDate for a given input date.
     *
     * @param inputDate
     * @return
     */
    public static String getWeekStartEndDatesString(Date inputDate) {
        log.info("Inside getWeekStartEndDates:: inputDate: " + inputDate);
        return parseDate(getTimesheetWeekStartDate(inputDate)) + " - " + parseDate(getTimesheetWeekEndDate(inputDate));
    }

    /**
     * Returns a Map of Date, String for a given list of Dates.
     *
     * @param datesList
     * @return
     */
    public static Map<Date, String> getWeekDatesMap(List<Date> datesList) {
        log.info("Inside getWeekDatesMap of DateUtils:: ");
        Map<Date, String> datesMap = new TreeMap<>(Collections.reverseOrder());
        for (Date inputDate : datesList) {
            datesMap.put(inputDate, parseDate(inputDate));
        }

        return datesMap;
    }

    /**
     * Returns a Map of Date, String of Weekly Start Dates.
     *
     * @return
     */
    public static Map<Date, String> getWeekStartDatesMap() {
        log.info("Inside getWeekStartDatesMap of DateUtils:: ");
        Map<Date, String> datesMap = new TreeMap<>(Collections.reverseOrder());
        for (Date inputDate : getListWeekStartDatesOfLastThreeMonths()) {
            datesMap.put(inputDate, parseDate(inputDate));
        }

        return datesMap;
    }

    /**
     * Returns a Map of Date, String of Weekly End Dates.
     *
     * @return
     */
    public static Map<Date, String> getWeekEndDatesMap() {
        log.info("Inside getWeekEndDatesMap of DateUtils:: ");
        Map<Date, String> datesMap = new TreeMap<>(Collections.reverseOrder());
        for (Date inputDate : getListWeekEndDatesOfLastThreeMonths()) {
            datesMap.put(inputDate, parseDate(inputDate));
        }

        return datesMap;
    }


    /**
     * Returns a map of Date, String values for a given endDatesList.
     *
     * @param endDatesList
     * @return
     */
    public static Map<Date, String> getWeekStartEndDatesMap(List<Date> endDatesList) {
        log.info("Inside getWeekStartEndDatesMap of DateUtils:: ");
        Map<Date, String> startEndDatesMap = new TreeMap<>(Collections.reverseOrder());
        for (Date endDate : endDatesList) {
            startEndDatesMap.put(endDate, getWeekStartEndDatesString(endDate));
        }

        return startEndDatesMap;
    }


}
