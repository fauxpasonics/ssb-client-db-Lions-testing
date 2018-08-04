SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [ods].[SSO_CustomerComposite]
AS
SELECT ssv.id,
       COALESCE(NULLIF(ssv.first_name, ''), ssvfu.first_name) first_name,
       COALESCE(NULLIF(ssv.last_name, ''), ssvfu.last_name) last_name,
       COALESCE(NULLIF(ssv.gender, ''), ssvfu.gender) gender,
       COALESCE(NULLIF(ssv.email, ''), ssvfu.email) email,
       ssv.phone,
       ssvfu.birthday,
	   ssv.created
FROM ods.SSO_visitor (NOLOCK) ssv
    LEFT JOIN ods.SSO_visitor_facebook_user (NOLOCK) ssvfu
        ON ssv.id = ssvfu.visitor_id;


GO
