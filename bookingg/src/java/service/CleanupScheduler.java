/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

import dal.DatabaseCleanup;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;
/**
 *
 * @author Admin
 */

public class CleanupScheduler {
    public static void main(String[] args) {
        DatabaseCleanup cleaner = new DatabaseCleanup();
        ScheduledExecutorService scheduler = Executors.newScheduledThreadPool(1);

        // Chạy tự động mỗi 5 phút
        scheduler.scheduleAtFixedRate(cleaner::cleanUpDatabase, 0, 5, TimeUnit.MINUTES);
    }
}

