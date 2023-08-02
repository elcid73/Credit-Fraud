
-- Group Unique Users. transaction numbers by user, total spend by user and average spend by user
CREATE VIEW unique_users_data AS
SELECT card_holder.cardholder_name, Count(transactions.transaction_id) AS number_transactions, Sum(transactions.transaction_amount) AS total_amount_spent, Avg(transactions.transaction_amount) AS average_amount_spent 
FROM (transactions JOIN credit_card ON transactions.card_id = credit_card.card_id) 
JOIN card_holder ON credit_card.cardholder_id = card_holder.cardholder_id
GROUP BY card_holder.cardholder_name
ORDER BY Count(transactions.transaction_id) DESC;

-- Count of transactions less than $2 by user
CREATE VIEW under_two_dollars_data AS
SELECT card_holder.cardholder_name, Count(transactions.transaction_id) AS number_transactions
FROM (transactions JOIN credit_card ON transactions.card_id = credit_card.card_id) INNER JOIN card_holder ON credit_card.cardholder_id = card_holder.cardholder_id
WHERE (((transactions.transaction_amount)<2))
GROUP BY card_holder.cardholder_name
ORDER BY Count(transactions.transaction_id) DESC;


-- Transactions between 7 and 9 with merchant data
CREATE VIEW seven_to_nine_transactions AS
SELECT transactions.transaction_id, transactions.transaction_amount, transactions.transaction_date, merchant.merchant_name
FROM transactions JOIN merchant ON transactions.merchant_id = merchant.merchant_id
WHERE transaction_date::time(0) >= '07:00:00' AND transaction_date::time(0) <= '09:00:00'
ORDER BY transactions.transaction_amount DESC
LIMIT 100;


-- Transactions after 9 with merchant data
CREATE VIEW after_nine_transactions AS
SELECT transactions.transaction_id, transactions.transaction_amount, transactions.transaction_date, merchant.merchant_name
FROM transactions JOIN merchant ON transactions.merchant_id = merchant.merchant_id
WHERE transaction_date::time(0) > '09:00:00' 
ORDER BY transactions.transaction_amount DESC
LIMIT 100;

-- Cardholders' Id 2 and 18 data
SELECT credit_card.cardholder_id, transactions.transaction_date, transactions.transaction_amount
FROM transactions JOIN credit_card ON transactions.card_id = credit_card.card_id
WHERE (((credit_card.cardholder_id)=2 Or (credit_card.cardholder_id)=18));

-- Cardholder Id 25 data
SELECT credit_card.cardholder_id, transactions.transaction_date, transactions.transaction_amount
FROM transactions JOIN credit_card ON transactions.card_id = credit_card.card_id
WHERE (credit_card.cardholder_id)=25;