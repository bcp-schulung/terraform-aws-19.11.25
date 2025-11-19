# 🧩 Terraform Übungsaufgabe – Infrastruktur pro Teilnehmer automatisiert bereitstellen

In dieser Aufgabe schlüpfen Sie in die Rolle eines **Seminarleiters**, der mittels **Terraform** automatisiert eine vollständige Trainingsumgebung für jeden Kursteilnehmer bereitstellt.  
Ziel ist es, aus einer vorgegebenen **Teilnehmerliste** (Namestrings) für **jeden Teilnehmer** identische, aber voneinander logisch getrennte Ressourcen aufzubauen.

---

## 🎯 Zielsetzung

Für **jeden Teilnehmer** sollen automatisiert folgende Ressourcen erstellt werden:

1. **EC2-Instanzen**
   - Eine bestimmte Anzahl an EC2-Maschinen pro Teilnehmer (z. B. 2–3 Instanzen, Anzahl als Variable definierbar)
   - Instanzen sollen eindeutig dem entsprechenden Teilnehmer zuordenbar sein (z. B. via Tags / Namensschema)

2. **IAM User + IAM Rolle**
   - Pro Teilnehmer einen dedizierten IAM-User anlegen
   - Eine IAM-Rolle für den Benutzer erstellen
   - Berechtigungen so definieren, dass der Teilnehmer **auf alle für ihn vorgesehenen Ressourcen zugreifen kann, aber nicht auf die anderer Teilnehmer**

3. **Datenbankzugang**
   - Eine eigene Datenbank pro Teilnehmer anlegen (z. B. RDS oder Aurora Serverless)
   - Der Teilnehmer darf **ausschließlich Zugriff auf seine Datenbank** haben

4. **Container-Anwendung**
   - Eine **Nginx-Webanwendung** wird pro Teilnehmer als **AWS Fargate-Service (ECS)** bereitgestellt
   - Die Anwendung soll erreichbar sein, z. B. durch einen Application Load Balancer

---

## 🔐 Wichtige Anforderungen

- **Isolation der Umgebungen:**  
  Ein Teilnehmer darf nie Zugriff auf Ressourcen eines anderen Teilnehmers bekommen.
- **Zugriffsrechte über IAM korrekt modellieren:**  
  Der IAM-User / die IAM-Rolle eines Teilnehmers muss Zugriff auf:
  - seine eigenen EC2-Instanzen
  - seine Datenbank
  - seinen Fargate-Service
- **Automatisierung über Schleifen / Module:**  
  Die Teilnehmerliste soll **nicht manuell**, sondern über `for_each`, `count` oder **Terraform-Module** abgearbeitet werden.

---

## 📦 Erwartetes Endergebnis

Am Ende sollen Sie folgende Punkte liefern:

- Ein funktionsfähiges Terraform-Projekt (mit oder ohne Module)
- Variablenstruktur (z. B. Liste der Teilnehmer)
- Output-Werte (z. B. URLs der Fargate-Services, Zugangsdaten)
- Kurze Dokumentation:
  - Wie das Projekt ausgeführt wird
  - Welche Entscheidungen zur IAM-Sicherheit getroffen wurden

---

## 💡 Zusatz (optional)

Wer früh fertig wird, kann zusätzliche Features integrieren, z. B.:

- Logging & Monitoring (CloudWatch)
- Kostenoptimierung (Instance-Type / Autoscaling)
- Passwort- oder Secret-Management (SSM Parameter Store / Secrets Manager)

---

## 🧾 Hinweis

Achten Sie beim Implementieren besonders auf einen **sauberen, reproduzierbaren Aufbau der Infrastruktur**.  
Strukturieren Sie sinnvolle Module, damit Skalierbarkeit und Wiederverwendbarkeit gewährleistet sind.

---

### Viel Erfolg! 🚀  
Freuen Sie sich auf eine aufschlussreiche Übung zur Automatisierung, Skalierung und Sicherheitsmodellierung in Terraform.
