1) cp5_orders_view
Содержит поля:
- номер заказа = id из cp5_orders
- дата и время заказа = order_time из datetime
- ФИО заказавшего = FIO из cp5_workers
- Название компании = name из cp5_companies

Запрос на создание:

CREATE OR REPLACE VIEW cp5_orders_view (order_number, order_time, FIO, company_name)
AS select cp5_orders.id, cp5_orders.order_time, cp5_workers.FIO, cp5_companies.name
from (cp5_orders, cp5_workers, cp5_companies)
where((cp5_orders.id = cp5_workers.id) and (cp5_workers.company_id = cp5_companies.id));


2) cp5_company_orders_view
Содержит поля:
- Название компании = name из cp5_companies
- Количество заказов = Формируется выводом как количество заказов всех сотрудников этой компании.

Запрос на создание:

CREATE OR REPLACE VIEW cp5_company_orders_view(company_name, orders_ammount)
AS select cp5_companies.name, COUNT(cp5_orders.id)
from (cp5_companies, cp5_workers, cp5_orders)
where((cp5_workers.id = cp5_orders.worker_id) and (cp5_workers.company_id = cp5_companies.id)) GROUP BY cp5_companies.name;

3) cp5_сompany_workers_view
Содержит поля:
- Компания = name из cp5_companies
- Количество сотрудников = Формируется выводом как количество сотрудников с id = id заданной компании

Запрос на создание:

CREATE OR REPLACE VIEW cp5_сompany_workers_view(company_name, workers_ammount)
AS select cp5_companies.name, COUNT(cp5_workers.id)
from (cp5_companies, cp5_workers)
where(cp5_workers.company_id = cp5_companies.id) GROUP BY cp5_companies.name;




