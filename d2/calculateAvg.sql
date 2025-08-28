-- Tampilkan rerata harga dari product yang punya promo 
-- dikelompokkan berdasarkan promonya
-- dimana reratanya bernilai maksimal 16.000

SELECT promo_id,
       avg(price) as 'rerata_harga'
FROM products
WHERE promo_id is not null
GROUP BY promo_id
HAVING avg(price) < 16000;