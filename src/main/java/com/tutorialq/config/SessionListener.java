package com.tutorialq.config;

import lombok.extern.slf4j.Slf4j;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

@Slf4j
public class SessionListener implements HttpSessionListener {

    /*
     * This method is used to set the maximum inactive interval in seconds. After this interval session will get destroyed.
     */
    @Override
    public void sessionCreated(HttpSessionEvent event) {
        try {
            event.getSession().setMaxInactiveInterval(60 * 60);
        } catch (Exception ex) {
            log.error("Exception while getting the Max Inactive Interval " + ex);
        }

    }

    /*
     * After the given inactive interval, session will get destroyed.
     */
    @Override
    public void sessionDestroyed(HttpSessionEvent event) {
        log.warn("==== Session is destroyed ====");
    }

}
