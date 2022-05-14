SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `foodorder`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `username` varchar(30) NOT NULL,
  `fullname` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `contact` varchar(30) NOT NULL,
  `address` varchar(50) NOT NULL,
  `password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`username`, `fullname`, `email`, `contact`, `address`, `password`) VALUES
('birju', 'BIRJU KUMAR', 'bkm123r@gmail.com', '8903079750', 'Pondicherry ,', 'Birju123@'),
('ckumar', 'CHANDAN KUMAR', 'ckj40856@gmail.com', '9487810674', 'Punjab,', 'Ckumar'),
('nidha', 'nidha', 'nidha@gmail.com', '998696572', 'Maharashtra', 'suhail'),
('pratheek083', 'Pratheek Shiri', 'pratheek@gmail.com', '8779546521', 'Hyderabad', 'pratheek'),
('rakshithk00', 'Rakshith Kotian', 'rakshith@gmail.com', '9547123658', 'Gujarat', 'rakshith');

-- --------------------------------------------------------

--
-- Table structure for table `food`
--

CREATE TABLE `food` (
  `F_ID` int(30) NOT NULL,
  `name` varchar(30) NOT NULL,
  `price` int(30) NOT NULL,
  `description` varchar(200) NOT NULL,
  `images_path` varchar(200) NOT NULL,
  `options` varchar(10) NOT NULL DEFAULT 'ENABLE'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `food`
--

INSERT INTO `food` (`F_ID`, `name`, `price`, `description`, `images_path`, `options`) VALUES
(58, 'Expresso', 140, 'concentrated coffee made by forcing pressurized water through finely ground coffee beans.', 'images/expresso.jpg', 'ENABLE'),
(59, 'Macchiato', 160, 'Macchiato', 'images/macchiato.jpg', 'ENABLE'),
(60, 'Chocolate Hazelnut Truffle', 99, 'This very delicious chocolate hazelnut truffle.', 'images/Chocolate_Hazelnut_Truffle.jpg', 'ENABLE'),
(61, 'Happy Happy Choco Chip Shake', 180, 'Happy Happy Choco Chip Shake - a perfect party sweet treat.', 'images/Happy_Happy_Choco_Chip_Shake.jpg', 'ENABLE'),
(62, 'Cappuccino', 100, 'Our famous Cappiccino', 'images/cappuccino.jpg', 'ENABLE'),
(63, 'Coconut Milk latte', 275, 'Made from best coconut', 'images/milklatte.jpg', 'ENABLE'),
(65, 'Classic Coffee', 70, 'Classic coffee for classic day', 'images/coffee.jpg', 'DISABLE'),
(68, 'Cafe mocha', 185, 'Tasty Mocha coffee ', 'images/paneer pakora.jpg', 'DISABLE'),
(69, 'Coffee', 125, 'concentrated coffee made by forcing pressurized water through finely ground coffee beans.', 'images/coffee.jpg', 'ENABLE'),
(70, 'Tea', 70, 'The simple elixir of tea is of our natural world.', 'images/tea.jpg', 'ENABLE'),
(71, 'Ethiopian Coffee',170, 'Amazing Ethiopian coffee', 'images/ethiopian.jpg', 'ENABLE'),
(72, 'Vanilla latte', 160, 'Specially made for you', 'images/vanillalatte.jpg', 'ENABLE'),
(73, 'Caramel Macchiato', 135, 'Tasty!!! Caramel Macchiato', 'images/caramel.jpg', 'ENABLE'),
(77, 'Signature Hot Chocolate', 200, 'Hot Chocolate', 'images/signature.jpg', 'ENABLE'),
(78, 'Mocha Cookie Crumble Frappuccino', 75, 'With imported cookies', 'images/mocha.jpg', 'ENABLE'),
(79, 'Citrus Cold Brew', 145, 'TASTY', 'images/cold.jpg', 'ENABLE');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_ID` int(30) NOT NULL,
  `F_ID` int(30) NOT NULL,
  `foodname` varchar(30) NOT NULL,
  `price` int(30) NOT NULL,
  `quantity` int(30) NOT NULL,
  `username` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_ID`, `F_ID`, `foodname`, `price`, `quantity`, `username`) VALUES
(1, 58, 'Juicy Masala Paneer Kathi Roll', 40, 1, 'ckumar'),
(2, 61, 'Happy Happy Choco Chip Shake', 80, 2, 'ckumar'),
(3, 61, 'Happy Happy Choco Chip Shake', 80, 2, 'ckumar'),
(4, 65, 'Coffee', 25, 4, 'ckumar'),
(5, 58, 'Juicy Masala Paneer Kathi Roll', 40, 7, 'ckumar'),
(6, 65, 'Coffee', 25, 2, 'ckumar'),
(7, 58, 'Juicy Masala Paneer Kathi Roll', 40, 7, 'ckumar'),
(8, 65, 'Coffee', 25, 2, 'ckumar'),
(9, 60, 'Chocolate Hazelnut Truffle', 99, 1, 'ckumar'),
(10, 59, 'Meurig Fish', 60, 1, 'ckumar'),
(11, 60, 'Chocolate Hazelnut Truffle', 99, 1, 'ckumar'),
(12, 65, 'Coffee', 25, 1, 'ckumar'),
(13, 59, 'Meurig Fish', 60, 4, 'ckumar'),
(14, 58, 'Juicy Masala Paneer Kathi Roll', 40, 1, 'ckumar');
--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `food`
--
ALTER TABLE `food`
  ADD PRIMARY KEY (`F_ID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_ID`),
  ADD KEY `F_ID` (`F_ID`),
  ADD KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `food`
--
ALTER TABLE `food`
  MODIFY `F_ID` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_ID` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`F_ID`) REFERENCES `food` (`F_ID`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`username`) REFERENCES `customer` (`username`);
COMMIT;