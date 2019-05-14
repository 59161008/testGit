-- phpMyAdmin SQL Dump
-- version 4.2.12deb2+deb8u5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 29, 2019 at 12:06 AM
-- Server version: 5.5.62-0+deb8u1
-- PHP Version: 7.0.33-0+deb9u3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `oppmsdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `ppm_board`
--

CREATE TABLE IF NOT EXISTS `ppm_board` (
`bo_id` int(11) NOT NULL,
  `bo_name` varchar(20) NOT NULL,
  `bo_color` varchar(10) NOT NULL,
  `bo_pj_id` int(10) NOT NULL,
  `bo_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `bo_st` int(2) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=801 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ppm_check_file`
--

CREATE TABLE IF NOT EXISTS `ppm_check_file` (
`ds_file_id` int(16) NOT NULL,
  `ds_filename` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=204 DEFAULT CHARSET=utf8 COMMENT='1';

-- --------------------------------------------------------

--
-- Table structure for table `ppm_defect_history`
--

CREATE TABLE IF NOT EXISTS `ppm_defect_history` (
`dfh_id` int(11) NOT NULL,
  `dfh_seq` int(11) NOT NULL,
  `dfh_start` datetime DEFAULT NULL,
  `dfh_stop` datetime DEFAULT NULL,
  `dfh_time` time DEFAULT NULL,
  `dfh_status` enum('Yes','No') NOT NULL DEFAULT 'No',
  `dfh_dfl_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ppm_defect_log`
--

CREATE TABLE IF NOT EXISTS `ppm_defect_log` (
`dfl_id` int(11) NOT NULL,
  `dfl_status` enum('Yes','No') NOT NULL DEFAULT 'No',
  `dfl_desc` text,
  `dfl_time` datetime DEFAULT NULL,
  `dfl_seq` int(11) DEFAULT NULL,
  `dfl_num_def` int(11) DEFAULT NULL,
  `dfl_inject_phs_id` int(11) DEFAULT NULL,
  `dfl_remove_phs_id` int(11) DEFAULT NULL,
  `dfl_dfl_id` int(11) DEFAULT NULL,
  `dfl_timl_id` int(11) DEFAULT NULL,
  `dfl_dft_id` int(11) DEFAULT NULL,
  `dfl_pg_id` int(11) NOT NULL,
  `dfl_std_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ppm_defect_sentence`
--

CREATE TABLE IF NOT EXISTS `ppm_defect_sentence` (
`ds_id` int(11) NOT NULL,
  `ds_sentence` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ppm_defect_sentence_keyword`
--

CREATE TABLE IF NOT EXISTS `ppm_defect_sentence_keyword` (
`dsk_id` int(11) NOT NULL,
  `dsk_keyword` varchar(255) NOT NULL,
  `dsk_ds_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ppm_defect_type`
--

CREATE TABLE IF NOT EXISTS `ppm_defect_type` (
`dft_id` int(11) NOT NULL,
  `dft_seq` int(11) NOT NULL,
  `dft_number` int(11) NOT NULL,
  `dft_name` varchar(255) NOT NULL,
  `dft_desc` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ppm_estimate_log`
--

CREATE TABLE IF NOT EXISTS `ppm_estimate_log` (
`el_id` int(11) NOT NULL,
  `el_time_e` time NOT NULL DEFAULT '00:00:00',
  `el_phs_id` int(11) NOT NULL,
  `el_pg_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7912 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ppm_feedback`
--

CREATE TABLE IF NOT EXISTS `ppm_feedback` (
`fb_id` int(11) NOT NULL,
  `fb_name` varchar(255) NOT NULL,
  `fb_date` date NOT NULL,
  `fb_desc` text NOT NULL,
  `fb_solution` text,
  `fb_fbs_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ppm_feedback_status`
--

CREATE TABLE IF NOT EXISTS `ppm_feedback_status` (
`fbs_id` int(11) NOT NULL,
  `fbs_seq` int(11) NOT NULL,
  `fbs_th` varchar(50) NOT NULL,
  `fbs_eng` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ppm_group`
--

CREATE TABLE IF NOT EXISTS `ppm_group` (
`grp_id` int(11) NOT NULL,
  `grp_name` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ppm_homework`
--

CREATE TABLE IF NOT EXISTS `ppm_homework` (
`hw_id` int(11) NOT NULL,
  `hw_name` varchar(40) NOT NULL,
  `hw_date_start` datetime NOT NULL,
  `hw_date_end` datetime NOT NULL,
  `hw_path` varchar(60) NOT NULL,
  `hw_explain` varchar(60) NOT NULL,
  `hw_status` int(2) NOT NULL,
  `hw_code` varchar(10) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ppm_language`
--

CREATE TABLE IF NOT EXISTS `ppm_language` (
`lang_id` int(11) NOT NULL,
  `lang_name` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ppm_loc`
--

CREATE TABLE IF NOT EXISTS `ppm_loc` (
  `ploc_pg_id` int(11) NOT NULL,
  `ploc_num_files` int(11) NOT NULL,
  `ploc_blank` int(11) NOT NULL,
  `ploc_loc` int(11) NOT NULL,
  `ploc_comment` int(11) NOT NULL,
  `ploc_language` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ppm_loc_diff`
--

CREATE TABLE IF NOT EXISTS `ppm_loc_diff` (
  `dloc_language` varchar(255) COLLATE utf8_estonian_ci NOT NULL,
  `dloc_num_files` int(11) NOT NULL,
  `dloc_loc` int(11) NOT NULL,
  `dloc_comment` int(11) NOT NULL,
  `dloc_blank` int(11) NOT NULL,
  `dloc_type` int(11) NOT NULL,
  `dloc_pg_id1` int(11) NOT NULL,
  `dloc_pg_id2` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ppm_loc_type`
--

CREATE TABLE IF NOT EXISTS `ppm_loc_type` (
`loct_id` int(11) NOT NULL,
  `loct_name` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ppm_log_connect`
--

CREATE TABLE IF NOT EXISTS `ppm_log_connect` (
`logc_id` int(11) NOT NULL,
  `logc_UsName` varchar(255) NOT NULL,
  `logc_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=19318 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ppm_notification_config`
--

CREATE TABLE IF NOT EXISTS `ppm_notification_config` (
`nc_id` int(11) NOT NULL,
  `nc_first` int(11) DEFAULT NULL,
  `nc_second` int(11) DEFAULT NULL,
  `nc_third` int(11) DEFAULT NULL,
  `nc_fourth` int(11) DEFAULT NULL,
  `nc_fifth` int(11) DEFAULT NULL,
  `nc_sixth` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ppm_parts_additions`
--

CREATE TABLE IF NOT EXISTS `ppm_parts_additions` (
`pa_id` int(11) NOT NULL,
  `pa_name` varchar(255) NOT NULL,
  `pa_size_e` decimal(5,2) NOT NULL,
  `pa_size_a` decimal(5,2) NOT NULL,
  `pa_item_e` int(11) NOT NULL,
  `pa_item_a` int(11) NOT NULL,
  `pa_nrs` enum('Y','N') NOT NULL,
  `pa_pts_id` int(11) NOT NULL,
  `pa_psp_id` int(11) NOT NULL,
  `pa_form_e` enum('Y','N') NOT NULL,
  `pa_size` decimal(5,2) NOT NULL,
  `pa_ptt_id` int(11) NOT NULL,
  `pa_lang_id` int(11) NOT NULL,
  `pa_rs_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4113 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ppm_parts_size`
--

CREATE TABLE IF NOT EXISTS `ppm_parts_size` (
`pts_id` int(11) NOT NULL,
  `pts_size` decimal(5,2) NOT NULL,
  `pts_ptt_id` int(11) NOT NULL,
  `pts_lang_id` int(11) NOT NULL,
  `pts_rs_id` int(11) NOT NULL,
  `pts_pg_id` int(8) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=439 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ppm_parts_type`
--

CREATE TABLE IF NOT EXISTS `ppm_parts_type` (
`ptt_id` int(11) NOT NULL,
  `ptt_name` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ppm_part_lang_type`
--

CREATE TABLE IF NOT EXISTS `ppm_part_lang_type` (
`plt_id` int(11) NOT NULL,
  `plt_ptt_id` int(11) NOT NULL,
  `plt_lang_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ppm_phase`
--

CREATE TABLE IF NOT EXISTS `ppm_phase` (
`phs_id` int(11) NOT NULL,
  `phs_seq` int(11) NOT NULL,
  `phs_name` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ppm_profile_program_notificaion`
--

CREATE TABLE IF NOT EXISTS `ppm_profile_program_notificaion` (
  `pg_id_st` int(12) NOT NULL,
  `pg_profile` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ppm_program`
--

CREATE TABLE IF NOT EXISTS `ppm_program` (
`pg_id` int(11) NOT NULL,
  `pg_seq_id` int(11) NOT NULL,
  `pg_name` varchar(255) NOT NULL,
  `pg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `pg_pj_id` int(11) NOT NULL,
  `pg_pgs_id` int(11) NOT NULL DEFAULT '1',
  `pg_pspt_id` int(11) NOT NULL,
  `pg_pg_id` int(11) NOT NULL,
  `pg_chw_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9326 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ppm_programfile`
--

CREATE TABLE IF NOT EXISTS `ppm_programfile` (
`pf_id` int(11) NOT NULL,
  `pf_file_name` varchar(255) COLLATE utf8_estonian_ci NOT NULL,
  `pf_file_type` varchar(255) COLLATE utf8_estonian_ci NOT NULL,
  `pf_file_path` varchar(255) COLLATE utf8_estonian_ci NOT NULL,
  `pf_full_path` varchar(255) COLLATE utf8_estonian_ci NOT NULL,
  `pf_orig_name` varchar(255) COLLATE utf8_estonian_ci NOT NULL,
  `pf_file_ext` varchar(50) COLLATE utf8_estonian_ci NOT NULL,
  `pf_file_size` double(11,2) NOT NULL,
  `pf_pg_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=14825 DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ppm_program_status`
--

CREATE TABLE IF NOT EXISTS `ppm_program_status` (
`pgs_id` int(11) NOT NULL,
  `pgs_seq` int(11) NOT NULL,
  `pgs_th` varchar(50) NOT NULL,
  `pgs_eng` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ppm_project`
--

CREATE TABLE IF NOT EXISTS `ppm_project` (
`pj_id` int(11) NOT NULL,
  `pj_grp_id` int(11) NOT NULL,
  `pj_name` varchar(255) NOT NULL,
  `pj_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `pj_pjt_id` int(11) NOT NULL,
  `pj_std_id` varchar(20) NOT NULL,
  `pj_pgt_id` int(11) NOT NULL,
  `pj_status` int(2) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2686 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ppm_project_adv`
--

CREATE TABLE IF NOT EXISTS `ppm_project_adv` (
`pjad_id` int(11) NOT NULL,
  `pjad_pj_id` int(11) NOT NULL,
  `pjad_adv_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ppm_project_language`
--

CREATE TABLE IF NOT EXISTS `ppm_project_language` (
  `pl_lang_id` int(11) NOT NULL,
  `pl_pj_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ppm_project_program_type`
--

CREATE TABLE IF NOT EXISTS `ppm_project_program_type` (
`pgt_id` int(11) NOT NULL,
  `pgt_name` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ppm_project_type`
--

CREATE TABLE IF NOT EXISTS `ppm_project_type` (
`pjt_id` int(11) NOT NULL,
  `pjt_name` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ppm_psp`
--

CREATE TABLE IF NOT EXISTS `ppm_psp` (
`psp_id` int(11) NOT NULL,
  `psp_loc_base` int(11) NOT NULL DEFAULT '0',
  `psp_time_a` time NOT NULL DEFAULT '00:00:00',
  `psp_loc_a` int(11) DEFAULT '0',
  `psp_addition_a` int(11) NOT NULL DEFAULT '0',
  `psp_reuse_a` int(11) NOT NULL DEFAULT '0',
  `psp_delete_a` int(11) NOT NULL DEFAULT '0',
  `psp_modify_a` int(11) NOT NULL DEFAULT '0',
  `psp_time_e` time NOT NULL DEFAULT '00:00:00',
  `psp_loc_e` int(11) NOT NULL DEFAULT '0',
  `psp_addition_e` int(11) NOT NULL DEFAULT '0',
  `psp_reuse_e` int(11) NOT NULL DEFAULT '0',
  `psp_delete_e` int(11) NOT NULL DEFAULT '0',
  `psp_modify_e` int(11) NOT NULL DEFAULT '0',
  `psp_pg_id` int(11) NOT NULL,
  `psp_std_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=7265 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ppm_psp_phase`
--

CREATE TABLE IF NOT EXISTS `ppm_psp_phase` (
`pphs_id` int(11) NOT NULL,
  `pphs_seq` int(11) NOT NULL,
  `pphs_pspt_id` int(11) NOT NULL,
  `pphs_phs_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=206 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ppm_psp_type`
--

CREATE TABLE IF NOT EXISTS `ppm_psp_type` (
`pspt_id` int(11) NOT NULL,
  `pspt_seq` int(11) NOT NULL,
  `pspt_name` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ppm_real_size`
--

CREATE TABLE IF NOT EXISTS `ppm_real_size` (
`rs_id` int(11) NOT NULL,
  `rs_name` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ppm_reused_parts`
--

CREATE TABLE IF NOT EXISTS `ppm_reused_parts` (
`rp_id` int(11) NOT NULL,
  `rp_name` varchar(255) NOT NULL,
  `rp_size_e` int(11) NOT NULL,
  `rp_size_a` int(11) NOT NULL,
  `rp_psp_id` int(11) NOT NULL,
  `rp_form_e` enum('Y','N') NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=1307 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ppm_schedule`
--

CREATE TABLE IF NOT EXISTS `ppm_schedule` (
`sch_id` int(11) NOT NULL,
  `sch_date_start` date NOT NULL,
  `sch_date_stop` date NOT NULL,
  `sch_week` int(11) NOT NULL,
  `sch_ph` int(11) NOT NULL,
  `sch_cph` int(11) NOT NULL,
  `sch_pv` decimal(5,2) NOT NULL,
  `sch_cpv` decimal(5,2) NOT NULL,
  `sch_ah` time NOT NULL DEFAULT '00:00:00',
  `sch_ah_decimal` decimal(5,2) NOT NULL DEFAULT '0.00',
  `sch_cah` decimal(5,2) NOT NULL DEFAULT '0.00',
  `sch_ev` decimal(5,2) NOT NULL DEFAULT '0.00',
  `sch_cev` decimal(5,2) NOT NULL,
  `sch_pg_id` int(11) NOT NULL,
  `sch_pj_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ppm_student_section`
--

CREATE TABLE IF NOT EXISTS `ppm_student_section` (
`stdsc_id` int(4) NOT NULL,
  `stdsc_name` varchar(20) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ppm_student_year`
--

CREATE TABLE IF NOT EXISTS `ppm_student_year` (
`stdy_id` int(4) NOT NULL,
  `stdy_num` varchar(20) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ppm_submit_homework`
--

CREATE TABLE IF NOT EXISTS `ppm_submit_homework` (
`shw_id` int(11) NOT NULL,
  `shw_grp_id` int(10) NOT NULL,
  `shw_hw_id` int(10) NOT NULL,
  `shw_up_id` int(10) NOT NULL COMMENT 'file path is located at ppm_programfile',
  `shw_std` int(10) NOT NULL,
  `shw_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `shw_pg_id` int(10) NOT NULL,
  `shw_status` int(2) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ppm_summary`
--

CREATE TABLE IF NOT EXISTS `ppm_summary` (
  `sum_pj_id` int(11) NOT NULL,
  `sum_pg_id` int(11) NOT NULL,
  `sum_phs_id` int(11) NOT NULL,
  `sum_time` time NOT NULL,
  `sum_time_todate` time NOT NULL,
  `sum_inject` int(11) NOT NULL,
  `sum_inject_todate` int(11) NOT NULL,
  `sum_remove` int(11) NOT NULL,
  `sum_remove_todate` int(11) NOT NULL,
  `sum_std_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ppm_task`
--

CREATE TABLE IF NOT EXISTS `ppm_task` (
`task_id` int(11) NOT NULL,
  `task_name` varchar(100) NOT NULL,
  `task_ph` int(11) NOT NULL,
  `task_cph` int(11) NOT NULL,
  `task_pv` decimal(5,2) NOT NULL,
  `task_cpv` decimal(5,2) NOT NULL,
  `task_ah` time NOT NULL DEFAULT '00:00:00',
  `task_ah_decimal` decimal(5,2) NOT NULL DEFAULT '0.00',
  `task_ev` decimal(5,2) NOT NULL DEFAULT '0.00',
  `task_cev` decimal(5,2) NOT NULL,
  `task_week` int(11) NOT NULL,
  `task_aw` int(11) NOT NULL,
  `task_seq` int(11) NOT NULL,
  `task_pj_id` int(11) NOT NULL,
  `task_pg_id` int(11) NOT NULL,
  `task_phs_id` int(11) NOT NULL,
  `task_sch_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ppm_teacher`
--

CREATE TABLE IF NOT EXISTS `ppm_teacher` (
`tech_id` int(4) NOT NULL,
  `tech_name` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ppm_team_program`
--

CREATE TABLE IF NOT EXISTS `ppm_team_program` (
`tpg_id` int(11) NOT NULL,
  `tpg_std_id` int(10) NOT NULL,
  `tpg_pg_id` int(10) NOT NULL,
  `tpg_pj_id` int(10) NOT NULL,
  `tpg_task_locate` int(10) NOT NULL,
  `tpg_std_st` int(10) NOT NULL,
  `tpg_st_pg` int(10) NOT NULL DEFAULT '0',
  `tpg_pgs_id` int(10) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=815 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ppm_team_project`
--

CREATE TABLE IF NOT EXISTS `ppm_team_project` (
`tpj_id` int(11) NOT NULL,
  `tpj_hd_id` int(10) NOT NULL,
  `tpj_hd_st` int(10) NOT NULL,
  `tpj_mb_id` int(10) NOT NULL,
  `tpj_mb_st` int(10) NOT NULL,
  `tpj_pj_id` int(10) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=175 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ppm_templates`
--

CREATE TABLE IF NOT EXISTS `ppm_templates` (
`tmp_id` int(11) NOT NULL,
  `tmp_seq` int(11) NOT NULL,
  `tmp_name` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=166 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ppm_template_psp`
--

CREATE TABLE IF NOT EXISTS `ppm_template_psp` (
`tmps_id` int(11) NOT NULL,
  `tmps_seq` int(11) NOT NULL,
  `tmps_pspt_id` int(11) NOT NULL,
  `tmps_tmp_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=262 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ppm_timelog_interrupt`
--

CREATE TABLE IF NOT EXISTS `ppm_timelog_interrupt` (
`titp_id` int(11) NOT NULL,
  `titp_seq` int(11) NOT NULL,
  `titp_time` time NOT NULL,
  `titp_desc` varchar(40) NOT NULL,
  `titp_timl_id` int(11) NOT NULL,
  `titp_std_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=932 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ppm_time_log`
--

CREATE TABLE IF NOT EXISTS `ppm_time_log` (
`timl_id` int(11) NOT NULL,
  `timl_start` datetime NOT NULL,
  `timl_stop` datetime NOT NULL,
  `timl_interp` time NOT NULL,
  `timl_delta` time NOT NULL,
  `timl_desc` text NOT NULL,
  `timl_status` tinyint(1) NOT NULL DEFAULT '0',
  `timl_phs_id` int(11) NOT NULL,
  `timl_pg_id` int(11) NOT NULL,
  `timl_task_id` int(11) NOT NULL DEFAULT '0',
  `timl_std_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=53801 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ppm_uploadsfile`
--

CREATE TABLE IF NOT EXISTS `ppm_uploadsfile` (
`up_id` int(11) NOT NULL,
  `up_file_name` varchar(255) NOT NULL,
  `up_file_type` varchar(255) NOT NULL,
  `up_file_path` varchar(255) NOT NULL,
  `up_full_path` varchar(255) NOT NULL,
  `up_orig_name` varchar(255) NOT NULL,
  `up_file_ext` varchar(50) NOT NULL,
  `up_file_size` double(11,2) NOT NULL,
  `up_us_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=339 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `quick`
--

CREATE TABLE IF NOT EXISTS `quick` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ppm_board`
--
ALTER TABLE `ppm_board`
 ADD PRIMARY KEY (`bo_id`);

--
-- Indexes for table `ppm_check_file`
--
ALTER TABLE `ppm_check_file`
 ADD PRIMARY KEY (`ds_file_id`);

--
-- Indexes for table `ppm_defect_history`
--
ALTER TABLE `ppm_defect_history`
 ADD PRIMARY KEY (`dfh_id`);

--
-- Indexes for table `ppm_defect_log`
--
ALTER TABLE `ppm_defect_log`
 ADD PRIMARY KEY (`dfl_id`), ADD KEY `dfl_inject_phs_id` (`dfl_inject_phs_id`), ADD KEY `dfl_remove_phs_id` (`dfl_remove_phs_id`), ADD KEY `dfl_pg_id` (`dfl_pg_id`);

--
-- Indexes for table `ppm_defect_sentence`
--
ALTER TABLE `ppm_defect_sentence`
 ADD PRIMARY KEY (`ds_id`);

--
-- Indexes for table `ppm_defect_sentence_keyword`
--
ALTER TABLE `ppm_defect_sentence_keyword`
 ADD PRIMARY KEY (`dsk_id`);

--
-- Indexes for table `ppm_defect_type`
--
ALTER TABLE `ppm_defect_type`
 ADD PRIMARY KEY (`dft_id`), ADD KEY `dft_seq` (`dft_seq`);

--
-- Indexes for table `ppm_estimate_log`
--
ALTER TABLE `ppm_estimate_log`
 ADD PRIMARY KEY (`el_id`);

--
-- Indexes for table `ppm_feedback`
--
ALTER TABLE `ppm_feedback`
 ADD PRIMARY KEY (`fb_id`);

--
-- Indexes for table `ppm_feedback_status`
--
ALTER TABLE `ppm_feedback_status`
 ADD PRIMARY KEY (`fbs_id`);

--
-- Indexes for table `ppm_group`
--
ALTER TABLE `ppm_group`
 ADD PRIMARY KEY (`grp_id`);

--
-- Indexes for table `ppm_homework`
--
ALTER TABLE `ppm_homework`
 ADD PRIMARY KEY (`hw_id`);

--
-- Indexes for table `ppm_language`
--
ALTER TABLE `ppm_language`
 ADD PRIMARY KEY (`lang_id`);

--
-- Indexes for table `ppm_loc_type`
--
ALTER TABLE `ppm_loc_type`
 ADD PRIMARY KEY (`loct_id`);

--
-- Indexes for table `ppm_log_connect`
--
ALTER TABLE `ppm_log_connect`
 ADD PRIMARY KEY (`logc_id`);

--
-- Indexes for table `ppm_notification_config`
--
ALTER TABLE `ppm_notification_config`
 ADD PRIMARY KEY (`nc_id`);

--
-- Indexes for table `ppm_parts_additions`
--
ALTER TABLE `ppm_parts_additions`
 ADD PRIMARY KEY (`pa_id`), ADD KEY `pa_pts_id` (`pa_pts_id`), ADD KEY `pa_pts_id_2` (`pa_pts_id`);

--
-- Indexes for table `ppm_parts_size`
--
ALTER TABLE `ppm_parts_size`
 ADD PRIMARY KEY (`pts_id`);

--
-- Indexes for table `ppm_parts_type`
--
ALTER TABLE `ppm_parts_type`
 ADD PRIMARY KEY (`ptt_id`);

--
-- Indexes for table `ppm_part_lang_type`
--
ALTER TABLE `ppm_part_lang_type`
 ADD PRIMARY KEY (`plt_id`);

--
-- Indexes for table `ppm_phase`
--
ALTER TABLE `ppm_phase`
 ADD PRIMARY KEY (`phs_id`), ADD KEY `phs_id` (`phs_id`), ADD KEY `phs_seq` (`phs_seq`);

--
-- Indexes for table `ppm_profile_program_notificaion`
--
ALTER TABLE `ppm_profile_program_notificaion`
 ADD PRIMARY KEY (`pg_id_st`);

--
-- Indexes for table `ppm_program`
--
ALTER TABLE `ppm_program`
 ADD PRIMARY KEY (`pg_id`);

--
-- Indexes for table `ppm_programfile`
--
ALTER TABLE `ppm_programfile`
 ADD PRIMARY KEY (`pf_id`);

--
-- Indexes for table `ppm_program_status`
--
ALTER TABLE `ppm_program_status`
 ADD PRIMARY KEY (`pgs_id`);

--
-- Indexes for table `ppm_project`
--
ALTER TABLE `ppm_project`
 ADD PRIMARY KEY (`pj_id`), ADD KEY `pj_pjt_id` (`pj_pjt_id`), ADD KEY `pj_std_id` (`pj_std_id`), ADD KEY `pj_pgt_id` (`pj_pgt_id`);

--
-- Indexes for table `ppm_project_adv`
--
ALTER TABLE `ppm_project_adv`
 ADD PRIMARY KEY (`pjad_id`);

--
-- Indexes for table `ppm_project_language`
--
ALTER TABLE `ppm_project_language`
 ADD KEY `pl_lang_id` (`pl_lang_id`), ADD KEY `pl_pj_id` (`pl_pj_id`), ADD KEY `pl_pj_id_2` (`pl_pj_id`), ADD KEY `pl_pj_id_3` (`pl_pj_id`);

--
-- Indexes for table `ppm_project_program_type`
--
ALTER TABLE `ppm_project_program_type`
 ADD PRIMARY KEY (`pgt_id`);

--
-- Indexes for table `ppm_project_type`
--
ALTER TABLE `ppm_project_type`
 ADD PRIMARY KEY (`pjt_id`);

--
-- Indexes for table `ppm_psp`
--
ALTER TABLE `ppm_psp`
 ADD PRIMARY KEY (`psp_id`);

--
-- Indexes for table `ppm_psp_phase`
--
ALTER TABLE `ppm_psp_phase`
 ADD PRIMARY KEY (`pphs_id`), ADD KEY `pphs_phs_id` (`pphs_phs_id`), ADD KEY `pphs_pspt_id` (`pphs_pspt_id`);

--
-- Indexes for table `ppm_psp_type`
--
ALTER TABLE `ppm_psp_type`
 ADD PRIMARY KEY (`pspt_id`);

--
-- Indexes for table `ppm_real_size`
--
ALTER TABLE `ppm_real_size`
 ADD PRIMARY KEY (`rs_id`);

--
-- Indexes for table `ppm_reused_parts`
--
ALTER TABLE `ppm_reused_parts`
 ADD PRIMARY KEY (`rp_id`);

--
-- Indexes for table `ppm_schedule`
--
ALTER TABLE `ppm_schedule`
 ADD PRIMARY KEY (`sch_id`);

--
-- Indexes for table `ppm_student_section`
--
ALTER TABLE `ppm_student_section`
 ADD PRIMARY KEY (`stdsc_id`), ADD KEY `stdsc_id` (`stdsc_id`), ADD KEY `stdsc_id_2` (`stdsc_id`);

--
-- Indexes for table `ppm_student_year`
--
ALTER TABLE `ppm_student_year`
 ADD PRIMARY KEY (`stdy_id`), ADD KEY `stdy_id` (`stdy_id`), ADD KEY `stdy_id_2` (`stdy_id`);

--
-- Indexes for table `ppm_submit_homework`
--
ALTER TABLE `ppm_submit_homework`
 ADD PRIMARY KEY (`shw_id`);

--
-- Indexes for table `ppm_task`
--
ALTER TABLE `ppm_task`
 ADD PRIMARY KEY (`task_id`);

--
-- Indexes for table `ppm_teacher`
--
ALTER TABLE `ppm_teacher`
 ADD PRIMARY KEY (`tech_id`), ADD KEY `tech_id` (`tech_id`);

--
-- Indexes for table `ppm_team_program`
--
ALTER TABLE `ppm_team_program`
 ADD PRIMARY KEY (`tpg_id`);

--
-- Indexes for table `ppm_team_project`
--
ALTER TABLE `ppm_team_project`
 ADD PRIMARY KEY (`tpj_id`);

--
-- Indexes for table `ppm_templates`
--
ALTER TABLE `ppm_templates`
 ADD PRIMARY KEY (`tmp_id`);

--
-- Indexes for table `ppm_template_psp`
--
ALTER TABLE `ppm_template_psp`
 ADD PRIMARY KEY (`tmps_id`);

--
-- Indexes for table `ppm_timelog_interrupt`
--
ALTER TABLE `ppm_timelog_interrupt`
 ADD PRIMARY KEY (`titp_id`);

--
-- Indexes for table `ppm_time_log`
--
ALTER TABLE `ppm_time_log`
 ADD PRIMARY KEY (`timl_id`), ADD KEY `timl_phs_id` (`timl_phs_id`), ADD KEY `timl_phs_id_2` (`timl_phs_id`), ADD KEY `timl_phs_id_3` (`timl_phs_id`), ADD KEY `timl_pg_id` (`timl_pg_id`);

--
-- Indexes for table `ppm_uploadsfile`
--
ALTER TABLE `ppm_uploadsfile`
 ADD PRIMARY KEY (`up_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ppm_board`
--
ALTER TABLE `ppm_board`
MODIFY `bo_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=801;
--
-- AUTO_INCREMENT for table `ppm_check_file`
--
ALTER TABLE `ppm_check_file`
MODIFY `ds_file_id` int(16) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=204;
--
-- AUTO_INCREMENT for table `ppm_defect_history`
--
ALTER TABLE `ppm_defect_history`
MODIFY `dfh_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=74;
--
-- AUTO_INCREMENT for table `ppm_defect_log`
--
ALTER TABLE `ppm_defect_log`
MODIFY `dfl_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=110;
--
-- AUTO_INCREMENT for table `ppm_defect_sentence`
--
ALTER TABLE `ppm_defect_sentence`
MODIFY `ds_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `ppm_defect_sentence_keyword`
--
ALTER TABLE `ppm_defect_sentence_keyword`
MODIFY `dsk_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `ppm_defect_type`
--
ALTER TABLE `ppm_defect_type`
MODIFY `dft_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `ppm_estimate_log`
--
ALTER TABLE `ppm_estimate_log`
MODIFY `el_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7912;
--
-- AUTO_INCREMENT for table `ppm_feedback`
--
ALTER TABLE `ppm_feedback`
MODIFY `fb_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `ppm_feedback_status`
--
ALTER TABLE `ppm_feedback_status`
MODIFY `fbs_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `ppm_group`
--
ALTER TABLE `ppm_group`
MODIFY `grp_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=70;
--
-- AUTO_INCREMENT for table `ppm_homework`
--
ALTER TABLE `ppm_homework`
MODIFY `hw_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=88;
--
-- AUTO_INCREMENT for table `ppm_language`
--
ALTER TABLE `ppm_language`
MODIFY `lang_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=115;
--
-- AUTO_INCREMENT for table `ppm_loc_type`
--
ALTER TABLE `ppm_loc_type`
MODIFY `loct_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `ppm_log_connect`
--
ALTER TABLE `ppm_log_connect`
MODIFY `logc_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=19318;
--
-- AUTO_INCREMENT for table `ppm_notification_config`
--
ALTER TABLE `ppm_notification_config`
MODIFY `nc_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `ppm_parts_additions`
--
ALTER TABLE `ppm_parts_additions`
MODIFY `pa_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4113;
--
-- AUTO_INCREMENT for table `ppm_parts_size`
--
ALTER TABLE `ppm_parts_size`
MODIFY `pts_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=439;
--
-- AUTO_INCREMENT for table `ppm_parts_type`
--
ALTER TABLE `ppm_parts_type`
MODIFY `ptt_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=137;
--
-- AUTO_INCREMENT for table `ppm_part_lang_type`
--
ALTER TABLE `ppm_part_lang_type`
MODIFY `plt_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=94;
--
-- AUTO_INCREMENT for table `ppm_phase`
--
ALTER TABLE `ppm_phase`
MODIFY `phs_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `ppm_program`
--
ALTER TABLE `ppm_program`
MODIFY `pg_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9326;
--
-- AUTO_INCREMENT for table `ppm_programfile`
--
ALTER TABLE `ppm_programfile`
MODIFY `pf_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14825;
--
-- AUTO_INCREMENT for table `ppm_program_status`
--
ALTER TABLE `ppm_program_status`
MODIFY `pgs_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `ppm_project`
--
ALTER TABLE `ppm_project`
MODIFY `pj_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2686;
--
-- AUTO_INCREMENT for table `ppm_project_adv`
--
ALTER TABLE `ppm_project_adv`
MODIFY `pjad_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ppm_project_program_type`
--
ALTER TABLE `ppm_project_program_type`
MODIFY `pgt_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `ppm_project_type`
--
ALTER TABLE `ppm_project_type`
MODIFY `pjt_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `ppm_psp`
--
ALTER TABLE `ppm_psp`
MODIFY `psp_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7265;
--
-- AUTO_INCREMENT for table `ppm_psp_phase`
--
ALTER TABLE `ppm_psp_phase`
MODIFY `pphs_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=206;
--
-- AUTO_INCREMENT for table `ppm_psp_type`
--
ALTER TABLE `ppm_psp_type`
MODIFY `pspt_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `ppm_real_size`
--
ALTER TABLE `ppm_real_size`
MODIFY `rs_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `ppm_reused_parts`
--
ALTER TABLE `ppm_reused_parts`
MODIFY `rp_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1307;
--
-- AUTO_INCREMENT for table `ppm_schedule`
--
ALTER TABLE `ppm_schedule`
MODIFY `sch_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `ppm_student_section`
--
ALTER TABLE `ppm_student_section`
MODIFY `stdsc_id` int(4) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `ppm_student_year`
--
ALTER TABLE `ppm_student_year`
MODIFY `stdy_id` int(4) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `ppm_submit_homework`
--
ALTER TABLE `ppm_submit_homework`
MODIFY `shw_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=46;
--
-- AUTO_INCREMENT for table `ppm_task`
--
ALTER TABLE `ppm_task`
MODIFY `task_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=48;
--
-- AUTO_INCREMENT for table `ppm_teacher`
--
ALTER TABLE `ppm_teacher`
MODIFY `tech_id` int(4) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `ppm_team_program`
--
ALTER TABLE `ppm_team_program`
MODIFY `tpg_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=815;
--
-- AUTO_INCREMENT for table `ppm_team_project`
--
ALTER TABLE `ppm_team_project`
MODIFY `tpj_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=175;
--
-- AUTO_INCREMENT for table `ppm_templates`
--
ALTER TABLE `ppm_templates`
MODIFY `tmp_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=166;
--
-- AUTO_INCREMENT for table `ppm_template_psp`
--
ALTER TABLE `ppm_template_psp`
MODIFY `tmps_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=262;
--
-- AUTO_INCREMENT for table `ppm_timelog_interrupt`
--
ALTER TABLE `ppm_timelog_interrupt`
MODIFY `titp_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=932;
--
-- AUTO_INCREMENT for table `ppm_time_log`
--
ALTER TABLE `ppm_time_log`
MODIFY `timl_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=53801;
--
-- AUTO_INCREMENT for table `ppm_uploadsfile`
--
ALTER TABLE `ppm_uploadsfile`
MODIFY `up_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=339;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `ppm_project`
--
ALTER TABLE `ppm_project`
ADD CONSTRAINT `ppm_project_ibfk_1` FOREIGN KEY (`pj_pjt_id`) REFERENCES `ppm_project_type` (`pjt_id`),
ADD CONSTRAINT `ppm_project_ibfk_2` FOREIGN KEY (`pj_pgt_id`) REFERENCES `ppm_project_program_type` (`pgt_id`);

--
-- Constraints for table `ppm_project_language`
--
ALTER TABLE `ppm_project_language`
ADD CONSTRAINT `ppm_project_language_ibfk_1` FOREIGN KEY (`pl_lang_id`) REFERENCES `ppm_language` (`lang_id`);

--
-- Constraints for table `ppm_psp_phase`
--
ALTER TABLE `ppm_psp_phase`
ADD CONSTRAINT `ppm_psp_phase_ibfk_1` FOREIGN KEY (`pphs_phs_id`) REFERENCES `ppm_phase` (`phs_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
ADD CONSTRAINT `ppm_psp_phase_ibfk_2` FOREIGN KEY (`pphs_pspt_id`) REFERENCES `ppm_psp_type` (`pspt_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
