CREATE DATABASE IF NOT EXISTS library_qms
  CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE library_qms;

CREATE TABLE IF NOT EXISTS quality_plans (
  id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(180) NOT NULL,
  objective TEXT NOT NULL,
  quality_factor VARCHAR(80) NOT NULL,
  owner_name VARCHAR(120) NOT NULL,
  entry_criteria TEXT,
  exit_criteria TEXT,
  review_frequency VARCHAR(80),
  status VARCHAR(40) NOT NULL DEFAULT 'Draft',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS reviews (
  id INT AUTO_INCREMENT PRIMARY KEY,
  review_type VARCHAR(80) NOT NULL,
  artifact VARCHAR(180) NOT NULL,
  reviewer VARCHAR(120) NOT NULL,
  review_date DATE NOT NULL,
  result VARCHAR(40) NOT NULL DEFAULT 'Pending',
  comments TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS defects (
  id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(180) NOT NULL,
  category VARCHAR(80) NOT NULL,
  severity VARCHAR(30) NOT NULL,
  description TEXT NOT NULL,
  assigned_to VARCHAR(120),
  status VARCHAR(50) NOT NULL DEFAULT 'Identified',
  found_in VARCHAR(120),
  resolution TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS quality_actions (
  id INT AUTO_INCREMENT PRIMARY KEY,
  problem TEXT NOT NULL,
  root_cause TEXT NOT NULL,
  corrective_action TEXT NOT NULL,
  preventive_action TEXT NOT NULL,
  owner_name VARCHAR(120),
  status VARCHAR(50) NOT NULL DEFAULT 'Open',
  verification TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS checklists (
  id INT AUTO_INCREMENT PRIMARY KEY,
  stage VARCHAR(60) NOT NULL,
  item_text TEXT NOT NULL,
  responsible VARCHAR(120),
  result VARCHAR(40) NOT NULL DEFAULT 'Not Checked',
  notes TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS improvements (
  id INT AUTO_INCREMENT PRIMARY KEY,
  source_metric VARCHAR(120),
  observation TEXT NOT NULL,
  proposed_change TEXT NOT NULL,
  owner_name VARCHAR(120),
  status VARCHAR(50) NOT NULL DEFAULT 'Proposed',
  outcome TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
