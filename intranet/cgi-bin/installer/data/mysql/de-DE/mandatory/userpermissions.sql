INSERT INTO permissions (module_bit, code, description) VALUES
   ( 1, 'circulate_remaining_permissions', 'Übrige Ausleihberechtigungen'),
   ( 1, 'override_renewals', 'Vormerksperren übergehen'),
   ( 1, 'overdues_report', 'Überfälligkeiten-Report ausführen'),
   ( 1, 'force_checkout', 'Ausleihsperren übergehen'),
   ( 1, 'manage_restrictions', 'Kontosperre "Gesperrt" aufheben'),
   ( 3, 'parameters_remaining_permissions', 'Übrige Administrationsberechtigungen'),
   ( 3, 'manage_circ_rules', 'Ausleihkonditionen verwalten'),
   ( 6, 'place_holds', 'Vormerkungen für Benutzer setzen'),
   ( 6, 'modify_holds_priority', 'Vormerkungspriorität verändern'),
   ( 9, 'edit_catalogue', 'Katalogdaten bearbeiten (Titel- und Exemplardaten ändern)'),
   ( 9, 'fast_cataloging', 'Schnellaufnahmen anlegen'),
   ( 9, 'edit_items', 'Exemplare bearbeiten'),
   (10, 'writeoff', 'Gebühren erlassen'),
   (10, 'remaining_permissions', 'Verbleibende Berechtigungen für die Verwaltung von Gebühren'),
   (11, 'vendors_manage', 'Lieferanten verwalten'),
   (11, 'contracts_manage', 'Vereinbarungen verwalten'),
   (11, 'period_manage', 'Etats verwalten'),
   (11, 'budget_manage', 'Konten verwalten'),
   (11, 'budget_modify', 'Konten verändern (keine Neuen anlegen, aber Bestehende ändern)'),
   (11, 'planning_manage', 'Etatplanung verwalten'),
   (11, 'order_manage', 'Bestellungen verwalten'),
   (11, 'order_manage_all', 'Bestellungen aller Bibliotheken, unabhängig von Berechtigungen, verwalten'),
   (11, 'group_manage', 'Bestellgruppen vewalten'),
   (11, 'order_receive', 'Lieferungen verwalten'),
   (11, 'budget_add_del', 'Konten hinzufügen/ändern, aber bestehende nicht ändern'),
   (11, 'budget_manage_all', 'Alle Konten verwalten'),
   (13, 'edit_news', 'Nachrichten für OPAC und Dienstoberfläche verfassen'),
   (13, 'label_creator', 'Signaturschilder, Barcodeetiketten und Ausweise erstellen'),
   (13, 'edit_calendar', 'Schließtage eintragen'),
   (13, 'moderate_comments', 'Benutzerkommentare moderieren'),
   (13, 'edit_notices', 'Benachrichtigungen verwalten'),
   (13, 'edit_notice_status_triggers', 'Mahntrigger für überfällige Medien verwalten'),
   (13, 'edit_quotes', '"Zitat des Tages" konfigurieren'),
   (13, 'view_system_logs', 'Logs durchsuchen/einsehen'),
   (13, 'inventory', 'Inventur durchführen'),
   (13, 'stage_marc_import', 'MARC-Datensätze zwischenspeichern'),
   (13, 'manage_staged_marc', 'MARC-Importe verwalten, auch Übernahme in Katalog und Import rückgängig machen'),
   (13, 'export_catalog', 'Titel- und Exemplardaten exportieren'),
   (13, 'import_patrons', 'Benutzerdaten importieren'),
   (13, 'edit_patrons', 'Stapelbearbeitung von Benutzerdaten durchführen'),
   (13, 'delete_anonymize_patrons', 'Inaktive Benutzer löschen und Ausleihhistorie anonymisieren (Benutzerausleihhistorie löschen)'),
   (13, 'batch_upload_patron_images', 'Benutzerfotos einzeln oder im Stapel hochladen'),
   (13, 'schedule_tasks', 'Aufgabenplaner verwenden'),
   (13, 'items_batchmod', 'Stapelbearbeitung von Exemplaren durchführen'),
   (13, 'items_batchdel', 'Stapellöschung von Exemplaren durchführen'),
   (13, 'manage_csv_profiles', 'CSV-Profile für Export verwalten'),
   (13, 'moderate_tags', 'Von Benutzern vergebene Tags moderieren'),
   (13, 'rotating_collections', 'Wandernde Sammlungen verwalten'),
   (13, 'upload_local_cover_images', 'Eigene Coverbilder hochladen'),
   (13, 'manage_patron_lists', 'Benutzerlisten anlegen, bearbeiten und löschen'),
   (13, 'marc_modification_templates', 'Templates für MARC-Modifikationen verwalten'),
   (15, 'check_expiration', 'Ablauf eines Abonnements prüfen'),
   (15, 'claim_serials', 'Fehlende Hefte reklamieren'),
   (15, 'create_subscription', 'Neue Abonnements anlegen'),
   (15, 'delete_subscription', 'Bestehende Abonnements löschen'),
   (15, 'edit_subscription', 'Bestehende Abonnements bearbeiten'),
   (15, 'receive_serials', 'Zugang von Heften'),
   (15, 'renew_subscription', 'Abonnements verlängern'),
   (15, 'routing', 'Umlauflisten verwalten'),
   (15, 'superserials', 'Abonnements aller Bibliotheken verwalten (nur relevant wenn IndependentBranches verwendet wird)'),
   (16, 'execute_reports', 'SQL-Reports ausführen'),
   (16, 'create_reports', 'SQL-Reports erstellen'),
   (18, 'manage_courses', 'Semesterapparate anlegen, bearbeiten und löschen'),
   (18, 'add_reserves', 'Semesterapparate anlegen'),
   (18, 'delete_reserves', 'Semesterapparate löschen'),
   (19, 'manage', 'Plugins verwalten (installieren/deinstallieren)'),
   (19, 'tool', 'Werkzeug-Plugins verwenden'),
   (19, 'report', 'Report-Plugins verwenden'),
   (19, 'configure', 'Plugins konfigurieren')
;
