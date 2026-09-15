-- ============================================================================
-- 019 - Product reviews + AI sentiment analysis
-- Depends on: 002 (customers), 004 (products via 002_schema_foundation)
--
-- Adds:
--   * product_reviews - customer review text/rating per product, with
--     sentiment_* columns written by agents.reviews.analyze_review /
--     bulk_analyze_reviews (same pattern as support_tickets.sentiment_* from
--     migration 017).
--   * ~50 seeded reviews across a range of products, joined by natural key
--     (sku / email) rather than hardcoded UUIDs so this seed doesn't depend
--     on the exact ids 07_products.sql / 03_customers.sql generated.
-- ============================================================================

CREATE TABLE IF NOT EXISTS product_reviews (
    review_id             UUID          PRIMARY KEY DEFAULT gen_random_uuid(),
    product_id            UUID          NOT NULL REFERENCES products(product_id) ON DELETE CASCADE,
    customer_id           UUID          REFERENCES customers(customer_id),
    rating                INT           NOT NULL CHECK (rating BETWEEN 1 AND 5),
    body                  TEXT          NOT NULL,
    sentiment_label       VARCHAR(10),  -- positive | neutral | negative
    sentiment_score       DECIMAL(3,2), -- -1.00 .. 1.00
    sentiment_summary     TEXT,
    sentiment_analyzed_at TIMESTAMPTZ,
    created_at            TIMESTAMPTZ   NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_product_reviews_product ON product_reviews (product_id);

ALTER TABLE product_reviews ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS product_reviews_public_read ON product_reviews;
CREATE POLICY product_reviews_public_read ON product_reviews FOR SELECT TO anon, authenticated USING (TRUE);
DROP POLICY IF EXISTS product_reviews_staff_all ON product_reviews;
CREATE POLICY product_reviews_staff_all ON product_reviews FOR ALL TO authenticated
    USING (is_staff())
    WITH CHECK (is_staff());

-- ----------------------------------------------------------------------------
-- Seed reviews: (sku, customer_email, rating, body) joined by natural key.
-- ----------------------------------------------------------------------------
INSERT INTO product_reviews (product_id, customer_id, rating, body, created_at)
SELECT p.product_id, c.customer_id, v.rating, v.body, v.created_at
FROM (VALUES
    ('TB-SMA-00001', 'aarav.sharma0@example.com', 5, 'Excellent phone, battery easily lasts a full day and the camera is fantastic in low light.', now() - interval '40 days'),
    ('TB-SMA-00001', 'diya.patel1@example.com', 2, 'Got a unit with a flickering screen. Support was slow to respond about the replacement.', now() - interval '25 days'),
    ('TB-SMA-00001', 'vivaan.reddy2@example.com', 4, 'Great performance overall, just wish it came with a charger in the box.', now() - interval '10 days'),
    ('TB-SMA-00002', 'ananya.nair3@example.com', 5, 'Best Android phone I have owned. Display is gorgeous and it never lags.', now() - interval '35 days'),
    ('TB-SMA-00002', 'reyansh.gupta4@example.com', 3, 'Decent phone but heats up quickly while gaming.', now() - interval '18 days'),
    ('TB-SMA-00003', 'ishita.iyer5@example.com', 4, 'Fast charging is a game changer, software still needs a few bug fixes though.', now() - interval '30 days'),
    ('TB-SMA-00003', 'kabir.bose6@example.com', 1, 'Arrived with a cracked back panel. Very disappointed with the packaging.', now() - interval '5 days'),
    ('TB-SMA-00004', 'aarav.sharma0@example.com', 5, 'Camera quality exceeded my expectations for this price range.', now() - interval '22 days'),
    ('TB-SMA-00005', 'diya.patel1@example.com', 4, 'Clean software experience, exactly what I wanted from a Pixel.', now() - interval '15 days'),
    ('TB-SMA-00005', 'vivaan.reddy2@example.com', 2, 'Battery drains faster than advertised. Considering a return.', now() - interval '3 days'),
    ('TB-LAP-00006', 'ananya.nair3@example.com', 5, 'Incredibly light and the battery life is unbelievable for a laptop this thin.', now() - interval '50 days'),
    ('TB-LAP-00006', 'reyansh.gupta4@example.com', 5, 'Perfect for my daily work, silent and fast. Highly recommend.', now() - interval '20 days'),
    ('TB-LAP-00007', 'ishita.iyer5@example.com', 3, 'Beautiful screen but the keyboard layout takes getting used to.', now() - interval '28 days'),
    ('TB-LAP-00007', 'kabir.bose6@example.com', 1, 'Delivered late and the trackpad has a manufacturing defect.', now() - interval '8 days'),
    ('TB-LAP-00008', 'aarav.sharma0@example.com', 4, 'Solid build quality as expected from ThinkPad, keyboard feels great.', now() - interval '33 days'),
    ('TB-LAP-00009', 'diya.patel1@example.com', 3, 'Good value laptop, but the fan gets noisy under load.', now() - interval '12 days'),
    ('TB-LAP-00010', 'vivaan.reddy2@example.com', 5, 'Fantastic gaming laptop, runs everything I throw at it smoothly.', now() - interval '19 days'),
    ('TB-LAP-00010', 'ananya.nair3@example.com', 2, 'Runs hot and the fans are loud even on light tasks.', now() - interval '6 days'),
    ('TB-TAB-00011', 'reyansh.gupta4@example.com', 5, 'The display is stunning for drawing and note-taking. Worth every rupee.', now() - interval '27 days'),
    ('TB-TAB-00011', 'ishita.iyer5@example.com', 4, 'Great tablet, wish the storage options were more affordable.', now() - interval '14 days'),
    ('TB-TAB-00012', 'kabir.bose6@example.com', 3, 'Does the job but the S Pen is sold separately which is annoying.', now() - interval '9 days'),
    ('TB-TAB-00012', 'aarav.sharma0@example.com', 1, 'Software feels laggy compared to competitors at this price.', now() - interval '4 days'),
    ('TB-SMA-00001', 'kabir.bose6@example.com', 5, 'Upgraded from an older model and the difference is night and day.', now() - interval '2 days'),
    ('TB-SMA-00002', 'ishita.iyer5@example.com', 5, 'Zero complaints, this is exactly what I needed.', now() - interval '17 days'),
    ('TB-SMA-00003', 'reyansh.gupta4@example.com', 4, 'Good phone overall, camera app crashes occasionally.', now() - interval '21 days'),
    ('TB-SMA-00004', 'vivaan.reddy2@example.com', 2, 'Customer service was unhelpful when I asked about a software issue.', now() - interval '11 days'),
    ('TB-SMA-00005', 'ananya.nair3@example.com', 5, 'Love the clean Android experience, updates come in fast too.', now() - interval '31 days'),
    ('TB-LAP-00006', 'diya.patel1@example.com', 4, 'Great for travel, though I miss having more ports.', now() - interval '24 days'),
    ('TB-LAP-00007', 'aarav.sharma0@example.com', 5, 'Premium feel all around, the screen is gorgeous for editing photos.', now() - interval '13 days'),
    ('TB-LAP-00008', 'kabir.bose6@example.com', 3, 'Reliable but starting to feel a bit dated compared to newer models.', now() - interval '7 days'),
    ('TB-LAP-00009', 'ishita.iyer5@example.com', 2, 'Screen hinge feels loose out of the box, disappointing for the price.', now() - interval '16 days'),
    ('TB-LAP-00010', 'reyansh.gupta4@example.com', 4, 'Great performance per rupee, just wish the trackpad was bigger.', now() - interval '23 days'),
    ('TB-TAB-00011', 'vivaan.reddy2@example.com', 5, 'My kids use it for school and it has held up great.', now() - interval '29 days'),
    ('TB-TAB-00012', 'ananya.nair3@example.com', 4, 'Solid all-rounder tablet, battery lasts almost two days for me.', now() - interval '26 days'),
    ('TB-SMA-00001', 'ananya.nair3@example.com', 1, 'Phone restarted randomly multiple times in the first week.', now() - interval '1 days'),
    ('TB-SMA-00002', 'reyansh.gupta4@example.com', 5, 'This is hands down the best value flagship this year.', now() - interval '32 days'),
    ('TB-SMA-00003', 'kabir.bose6@example.com', 4, 'Smooth performance, good cameras, would buy again.', now() - interval '34 days'),
    ('TB-SMA-00004', 'ishita.iyer5@example.com', 5, 'The display colors are stunning, very happy with this purchase.', now() - interval '36 days'),
    ('TB-SMA-00005', 'kabir.bose6@example.com', 3, 'Average experience, nothing stood out as particularly great or bad.', now() - interval '37 days'),
    ('TB-LAP-00006', 'vivaan.reddy2@example.com', 5, 'Absolutely love this machine, worth the investment for professionals.', now() - interval '38 days'),
    ('TB-LAP-00007', 'ananya.nair3@example.com', 2, 'Speakers are tinny and the webcam quality is subpar for video calls.', now() - interval '39 days'),
    ('TB-LAP-00008', 'diya.patel1@example.com', 5, 'Rock solid reliability, exactly what I expect from this brand.', now() - interval '41 days'),
    ('TB-LAP-00009', 'aarav.sharma0@example.com', 1, 'Received a used-looking unit with scratches, requested a refund.', now() - interval '42 days'),
    ('TB-LAP-00010', 'ishita.iyer5@example.com', 4, 'Handles everything I need for work and light gaming without issue.', now() - interval '43 days'),
    ('TB-TAB-00011', 'kabir.bose6@example.com', 3, 'Fine tablet but overpriced compared to similar options.', now() - interval '44 days'),
    ('TB-TAB-00012', 'reyansh.gupta4@example.com', 5, 'Perfect size for reading and browsing, very satisfied.', now() - interval '45 days'),
    ('TB-SMA-00001', 'reyansh.gupta4@example.com', 4, 'Reliable daily driver, good camera in most lighting conditions.', now() - interval '46 days'),
    ('TB-SMA-00002', 'kabir.bose6@example.com', 2, 'Fingerprint sensor is inconsistent and misses often.', now() - interval '47 days'),
    ('TB-SMA-00003', 'ananya.nair3@example.com', 5, 'Couldn''t be happier, exceeded expectations in every way.', now() - interval '48 days')
) AS v(sku, customer_email, rating, body, created_at)
JOIN products p ON p.sku = v.sku
JOIN customers c ON c.email = v.customer_email
WHERE NOT EXISTS (
    SELECT 1 FROM product_reviews pr
    WHERE pr.product_id = p.product_id AND pr.customer_id = c.customer_id AND pr.body = v.body
);
