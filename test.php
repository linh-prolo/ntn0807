<?php
echo phpversion() . "\n";
echo extension_loaded('pdo') ? 'PDO: OK' : 'PDO: MISSING';
echo "\n";
echo extension_loaded('pdo_mysql') ? 'PDO_MySQL: OK' : 'PDO_MySQL: MISSING';