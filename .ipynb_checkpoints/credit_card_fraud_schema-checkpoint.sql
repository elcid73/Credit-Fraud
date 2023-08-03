-- Create a table of card holders
CREATE TABLE card_holder (
  cardholder_id INTEGER NOT NULL PRIMARY KEY,
  cardholder_name VARCHAR
);

-- Create a table of credit card
CREATE TABLE credit_card (
  card_id VARCHAR(20) NOT NULL PRIMARY KEY,
  cardholder_id INTEGER NOT NULL,	
  FOREIGN KEY (cardholder_id) REFERENCES card_holder(cardholder_id)	
);

-- Create a junction merchant category table
CREATE TABLE merchant_category (
  merchant_category_id INTEGER NOT NULL PRIMARY KEY,
  category_name VARCHAR NOT NULL
);

-- Create a merchant table.
CREATE TABLE merchant (
  merchant_id INTEGER NOT NULL PRIMARY KEY,
  merchant_name VARCHAR NOT NULL,
  merchant_category_id INTEGER NOT NULL,	
  FOREIGN KEY (merchant_category_id) REFERENCES merchant_category(merchant_category_id)	
);

-- Create a transactions table.
CREATE TABLE transactions (
  transaction_id VARCHAR NOT NULL PRIMARY KEY,
  transaction_date TIMESTAMP NOT NULL,
  transaction_amount FLOAT NOT NULL,
  card_id VARCHAR(20) NOT NULL,	
  FOREIGN KEY (card_id) REFERENCES credit_card(card_id),
  merchant_id INTEGER NOT NULL,	
  FOREIGN KEY (merchant_id) REFERENCES merchant(merchant_id)	
);

