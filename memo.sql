select
  items.id,
  items.seller_id,
  items.buyer_id,
  items.status,
  items.name,
  items.price,
  items.description,
  items.image_name,
  items.category_id,
  items.created_at,
  items.updated_at,
  buyers.account_name as buyer_account_name,
  buyers.num_sell_items as buyer_num_sell_items,
  sellers.account_name as seller_account_name,
  sellers.num_sell_items as seller_num_sell_items,
  categories.id as category_id,
  categories.parent_id as category_parent_id,
  categories.category_name as category_category_name,
  tes.id as tes_id,
  tes.status as tes_status,
  shippings.reserve_id as shippings_reserve_id
from (
	SELECT *
	FROM items
	WHERE (seller_id = 2 OR buyer_id = 2)
	ORDER BY created_at DESC, id DESC LIMIT 10
) as items
left outer join users as buyers on buyers.id = items.buyer_id
left outer join users as sellers on sellers.id = items.seller_id
left outer join categories on categories.id = items.category_id
left outer join transaction_evidences as tes on tes.item_id = items.id
left outer join shippings on shippings.transaction_evidence_id = tes.id;

select
  items.id,
  items.seller_id,
  items.buyer_id,
  shippings.reserve_id
from (
	SELECT *
	FROM items
	WHERE (seller_id = 2 OR buyer_id = 2)
	ORDER BY created_at DESC, id DESC
) as items
left outer join users as buyers on buyers.id = items.buyer_id
left outer join users as sellers on sellers.id = items.seller_id
left outer join categories on categories.id = items.category_id
left outer join transaction_evidences as tes on tes.item_id = items.id
left outer join shippings on shippings.transaction_evidence_id = tes.id;

SELECT count(*)
FROM items
WHERE (seller_id = 2 OR buyer_id = 2)
ORDER BY created_at DESC, id DESC;
