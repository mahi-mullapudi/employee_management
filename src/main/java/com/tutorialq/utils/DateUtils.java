package com.tutorialq.utils;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import java.io.Serializable;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.time.temporal.ChronoUnit;
import java.time.temporal.TemporalAdjusters;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;
import java.util.stream.Collectors;
import java.util.stream.Stream;

@Component
@Slf4j
public class DateUtils implements Serializable {

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
     * Returns java.time LocalDate Week Start date (Monday) for a given date by taking inputDate.
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
     * Returns list of java util start of timesheet week Dates for last three months from current week.
     *
     * @return
     */
    public static List<LocalDate> getListLocalWeekStartDatesOfLastThreeMonths() {
        LocalDate startMonday = LocalDate.now()
                .with(TemporalAdjusters.previousOrSame(DayOfWeek.SUNDAY));
        long weeks = ChronoUnit.WEEKS.between(startMonday.minusMonths(3L), startMonday);
        List<LocalDate> collect = Stream.iterate(startMonday.minusWeeks(weeks), d -> d.plusWeeks(1L))
                .limit(weeks + 1)
                .collect(Collectors.toList());
        return collect;
    }

    /**
     * Formats the input LocalDate to a String.
     *
     * @param inputDate
     * @return
     */
    public static String parseLocalDate(LocalDate inputDate) {
        try {
            DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("MM/dd/yyyy");
            return inputDate.format(dateTimeFormatter);
        } catch (DateTimeParseException ex) {
            log.error("Error parsing the given LocalDate: " + inputDate);
            return "";
        }
    }

    public static String getStartAndEndDateStringByLocalEndDate(LocalDate endDate) {
        if (endDate != null) {
            return parseLocalDate(getLocalTimesheetWeekStartDateByLocalDate(endDate))
                    + " - "
                    + parseLocalDate(getLocalTimesheetWeekEndDateByLocalDate(endDate));
        } else {
            return "";
        }
    }

    /**
     * Returns the Map of End dates, Start date - End Date (String) used for display purposes.
     *
     * @param endDatesList
     * @return
     */
    public static Map<LocalDate, String> getWeekStartEndDatesMap(List<LocalDate> endDatesList) {
        log.info("Inside getWeekStartEndDatesMap of DateUtils:: ");
        Map<LocalDate, String> startEndDatesMap = new TreeMap<>(Collections.reverseOrder());
        for (LocalDate endDate : endDatesList) {
            startEndDatesMap.put(endDate, getStartAndEndDateStringByLocalEndDate(endDate));
        }
        return startEndDatesMap;
    }
}
