# Write your MySQL query statement below
-- Write a solution to report the first name, last name, city, and state of each person in the Person table. If the address of a personId is not present in the Address table, report null instead.

-- Return the result table in any order.

-- The result format is in the following example.

 

-- Example 1:

-- Input: 
-- Person table:
-- +----------+----------+-----------+
-- | personId | lastName | firstName |
-- +----------+----------+-----------+
-- | 1        | Wang     | Allen     |
-- | 2        | Alice    | Bob       |
-- +----------+----------+-----------+
-- Address table:
-- +-----------+----------+---------------+------------+
-- | addressId | personId | city          | state      |
-- +-----------+----------+---------------+------------+
-- | 1         | 2        | New York City | New York   |
-- | 2         | 3        | Leetcode      | California |
-- +-----------+----------+---------------+------------+
-- Output: 
-- +-----------+----------+---------------+----------+
-- | firstName | lastName | city          | state    |
-- +-----------+----------+---------------+----------+
-- | Allen     | Wang     | Null          | Null     |
-- | Bob       | Alice    | New York City | New York |
-- +-----------+----------+---------------+----------+
-- Explanation: 
-- There is no address in the address table for the personId = 1 so we return null in their city and state.
-- addressId = 1 contains information about the address of personId = 2.

/*
✅ Why LEFT JOIN?
You want to include all people, even if they don’t have address data.

LEFT JOIN keeps all rows from the Person table and fills in NULL for missing matches in the Address table.

❌ Why not INNER JOIN?
INNER JOIN only shows people who have address data.

So anyone without an address would be excluded.

❌ Why not RIGHT JOIN?
RIGHT JOIN keeps all rows from the Address table.

But you might lose people who don’t have addresses, which is not what you want here.
*/








select 
p.firstName,
p.lastName,
a.city,
a.state
FROM 
Person p 
LEFT JOIN 
Address a ON p.personId = a.personId;
