-- Run once in Supabase > SQL Editor, after creating your owner user (Authentication > Users)
-- and turning OFF "Allow new users to sign up" (Authentication > Sign In / Providers).
-- First delete any older policies that let the anon role insert or delete.
alter table public.products enable row level security;
create policy "Public can read products" on public.products for select to anon, authenticated using (true);
create policy "Owner can add products" on public.products for insert to authenticated with check (true);
create policy "Owner can delete products" on public.products for delete to authenticated using (true);
create policy "Public can view product images" on storage.objects for select to anon, authenticated using (bucket_id = 'product-images');
create policy "Owner can upload product images" on storage.objects for insert to authenticated with check (bucket_id = 'product-images');
create policy "Owner can delete product images" on storage.objects for delete to authenticated using (bucket_id = 'product-images');
