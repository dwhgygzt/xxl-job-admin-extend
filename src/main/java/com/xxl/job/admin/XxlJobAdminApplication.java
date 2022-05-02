package com.xxl.job.admin;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import tk.mybatis.spring.annotation.MapperScan;

/**
 * @author xuxueli 2018-10-28 00:38:13
 */
@SpringBootApplication
@MapperScan(basePackages = "com.xxl.job.admin.core.model.**.dao")
public class XxlJobAdminApplication {
	private static Logger logger = LoggerFactory.getLogger(XxlJobAdminApplication.class);

	public static void main(String[] args) {
		String banner = "\n" +
				"       __                              __                        __                            __                      __              __ \n" +
				"      /  |                            /  |                      /  |                          /  |                    /  |            /  |\n" +
				"      $$ |____    ______    ______   _$$ |_           _______  _$$ |_     ______    ______   _$$ |_           ______  $$ |   __       $$ |\n" +
				"      $$      \\  /      \\  /      \\ / $$   |         /       |/ $$   |   /      \\  /      \\ / $$   |         /      \\ $$ |  /  |      $$ |\n" +
				"      $$$$$$$  |/$$$$$$  |/$$$$$$  |$$$$$$/         /$$$$$$$/ $$$$$$/    $$$$$$  |/$$$$$$  |$$$$$$/         /$$$$$$  |$$ |_/$$/       $$ |\n" +
				"      $$ |  $$ |$$ |  $$ |$$ |  $$ |  $$ | __       $$      \\   $$ | __  /    $$ |$$ |  $$/   $$ | __       $$ |  $$ |$$   $$<        $$/ \n" +
				"      $$ |__$$ |$$ \\__$$ |$$ \\__$$ |  $$ |/  |       $$$$$$  |  $$ |/  |/$$$$$$$ |$$ |        $$ |/  |      $$ \\__$$ |$$$$$$  \\        __ \n" +
				"      $$    $$/ $$    $$/ $$    $$/   $$  $$/       /     $$/   $$  $$/ $$    $$ |$$ |        $$  $$/       $$    $$/ $$ | $$  |      /  |\n" +
				"      $$$$$$$/   $$$$$$/   $$$$$$/     $$$$/        $$$$$$$/     $$$$/   $$$$$$$/ $$/          $$$$/         $$$$$$/  $$/   $$/       $$/ \n" +
				"                                                                                                                                          ";

        SpringApplication.run(XxlJobAdminApplication.class, args);

		logger.info(banner);
	}

}