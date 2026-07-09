<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/erp/config/auth.php';
require_once $_SERVER['DOCUMENT_ROOT'] . '/erp/config/functions.php';

header('Content-Type: application/json');
requireLoginApi();

echo json_encode(['ip' => getClientIp()]);
