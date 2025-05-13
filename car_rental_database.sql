-- Drop the database if it exists
DROP DATABASE IF EXISTS car_rental_project;

-- Create the database
CREATE DATABASE IF NOT EXISTS car_rental_project;
USE car_rental_project;

-- Users table
CREATE TABLE IF NOT EXISTS users (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    address VARCHAR(200) NOT NULL,
    city VARCHAR(50) NOT NULL,
    zip_code VARCHAR(10) NOT NULL
);

-- Cars table
CREATE TABLE IF NOT EXISTS cars (
    car_id INT AUTO_INCREMENT PRIMARY KEY,
    make VARCHAR(50) NOT NULL,
    model VARCHAR(50) NOT NULL,
    year YEAR NOT NULL,
    color VARCHAR(20) NOT NULL,
    daily_rate DECIMAL(10, 2) NOT NULL,
    status ENUM('Available', 'Rented', 'Maintenance') NOT NULL DEFAULT 'Available',
    provider_id INT NOT NULL,
    image_url VARCHAR(255),
    FOREIGN KEY (provider_id) REFERENCES users(customer_id)
);

-- Rentals table
CREATE TABLE IF NOT EXISTS rentals (
    rental_id INT AUTO_INCREMENT PRIMARY KEY,
    car_id INT NOT NULL,
    customer_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_cost DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (car_id) REFERENCES cars(car_id),
    FOREIGN KEY (customer_id) REFERENCES users(customer_id)
);

-- Payments table
CREATE TABLE IF NOT EXISTS payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    rental_id INT NOT NULL,
    payment_date DATE NOT NULL,
    payment_method VARCHAR(50) NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (rental_id) REFERENCES rentals(rental_id)
);

-- Disable safe updates for bulk operations
SET SQL_SAFE_UPDATES=0;


INSERT INTO users (name, email, password, phone, address, city, zip_code) VALUES
('Neha Sharma', 'neha.sharma@gmail.com', '$2a$10$dM0X6cMxxTnSMK.ulhIG1OQeEYnMi2Vb7xaQIrOl0SkJ8VYnKrVdK', '9876543210', '123, ABC Street', 'Guwahati', '781001'),
('Rohan Das', 'rohan.das@gmail.com', '$2a$10$dM0X6cMxxTnSMK.ulhIG1OQeEYnMi2Vb7xaQIrOl0SkJ8VYnKrVdK', '8765432109', '456, XYZ Road', 'Guwahati', '781002'),
('Aarav Barua', 'aarav.barua@gmail.com', '$2a$10$dM0X6cMxxTnSMK.ulhIG1OQeEYnMi2Vb7xaQIrOl0SkJ8VYnKrVdK', '7654321098', '789, LMN Avenue', 'Guwahati', '781003'),
('Riya Devi', 'riya.devi@gmail.com', '$2a$10$dM0X6cMxxTnSMK.ulhIG1OQeEYnMi2Vb7xaQIrOl0SkJ8VYnKrVdK', '6543210987', '321, PQR Lane', 'Guwahati', '781004'),
('Vikram Bora', 'vikram.bora@gmail.com', '$2a$10$dM0X6cMxxTnSMK.ulhIG1OQeEYnMi2Vb7xaQIrOl0SkJ8VYnKrVdK', '5432109876', '654, DEF Colony', 'Guwahati', '781005');

-- Insert cars
INSERT INTO cars (make, model, year, color, daily_rate, image_url, provider_id)
VALUES
('Toyota Yaris', 'AS 02 EF 9012', 2015, 'Silver', 1875, 'https://res.cloudinary.com/dkiimfywe/image/upload/v1712429069/car_rental/mvplztivchkkclitbsri.jpg', 1),
('Hyundai Accent', 'AS 03 GH 2345', 2014, 'White', 2250, 'https://res.cloudinary.com/dkiimfywe/image/upload/v1712429070/car_rental/iejmit0g2i7ybzl5pphd.jpg', 2),
('Nissan Versa', 'AS 04 IJ 5678', 2013, 'Red', 2100, 'https://res.cloudinary.com/dkiimfywe/image/upload/v1712429070/car_rental/wqixxvyyn3gzccwpxsbx.jpg', 3),
('Kia Rio', 'AS 05 KL 9012', 2016, 'Blue', 2025, 'https://res.cloudinary.com/dkiimfywe/image/upload/v1712429070/car_rental/jpvxppwbtcg50kcuscmu.jpg', 1),
('Chevrolet Spark', 'AS 06 MN 3456', 2017, 'Yellow', 1950, 'https://res.cloudinary.com/dkiimfywe/image/upload/v1712429070/car_rental/aangeqlby1zfko2g4ohj.png', 2),
('Ford Fiesta', 'AS 07 OP 6789', 2015, 'Black', 2175, 'https://res.cloudinary.com/dkiimfywe/image/upload/v1712429070/car_rental/qfko2pkgrxklsm3sxtqa.jpg', 3),
('Honda Fit', 'AS 08 QR 0123', 2014, 'Gray', 2325, 'https://res.cloudinary.com/dkiimfywe/image/upload/v1712429071/car_rental/idhzgoo5ess0bpqqjrmx.png', 1),
('Suzuki Baleno', 'AS 09 ST 4567', 2016, 'Blue', 2100, 'https://res.cloudinary.com/dkiimfywe/image/upload/v1712429071/car_rental/jsabdckvyrpcqvc8f5ny.jpg', 2),
('Suzuki Swift', 'AS 10 UV 8901', 2015, 'White', 2025, 'https://res.cloudinary.com/dkiimfywe/image/upload/v1712429071/car_rental/ktr2cegthfcwumz1dpse.jpg', 3),
('Volkswagen Polo', 'AS 11 WX 2345', 2013, 'White', 2250, 'https://res.cloudinary.com/dkiimfywe/image/upload/v1712429070/car_rental/pihgtzr6lrcufbbdwutn.jpg', 1),
('Fiat 500', 'AS 12 YZ 6789', 2014, 'Black', 2175, 'https://res.cloudinary.com/dkiimfywe/image/upload/v1712429071/car_rental/ppmj3oj6sdoczkadgaco.jpg', 2),
('Dacia Sandero', 'AS 13 AB 0123', 2016, 'White', 1950, 'https://res.cloudinary.com/dkiimfywe/image/upload/v1712429071/car_rental/wyjhmb1oorxsfbug9su4.jpg', 3),
('Skoda Fabia', 'AS 14 CD 4567', 2015, 'Black', 2100, 'https://res.cloudinary.com/dkiimfywe/image/upload/v1712429071/car_rental/akeobsxdbp03xmxtp0pv.jpg', 1),
('Renault Kwid', 'AS 15 EF 8901', 2017, 'Foster Green', 1875, 'https://res.cloudinary.com/dkiimfywe/image/upload/v1712429071/car_rental/alu0j2zzlzlfvcdn9awt.jpg', 2),
('Tata Tiago', 'AS 16 GH 2345', 2018, 'Orange', 2025, 'https://res.cloudinary.com/dkiimfywe/image/upload/v1712429072/car_rental/oibg4muag6xiruyavc1k.png', 3);

-- Create stored procedure for updating car status
DELIMITER $$
CREATE PROCEDURE update_car_status()
BEGIN
    UPDATE cars
    SET status = 'Available'
    WHERE car_id IN (
        SELECT car_id
        FROM rentals
        WHERE end_date < CURDATE()
    );
END$$
DELIMITER ;

-- Create event to automatically update car status daily
CREATE EVENT IF NOT EXISTS update_car_status_event
ON SCHEDULE EVERY 1 DAY
STARTS CURRENT_TIMESTAMP
DO
  CALL update_car_status();