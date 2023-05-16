using Belaz.WeldingApp.Common.Entities.ProductInfo;
using Belaz.WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.WeldingApi.DataLayer.Helpers;

public class SeamAccountGenerator
{
    public static List<SeamAccount> GenerateSeamAccounts()
    {
        var seamAccounts = new List<SeamAccount>
        {
            new SeamAccount
            {
                Id = Guid.Parse("091df164-48ab-4961-a22b-1d872a61daac"),
                DateFromPlan = new DateTime(638141760000000000),
                SeamId = Guid.Parse("03876726-8de8-486d-a01b-50b644cc76f1"),
                ProductAccountId = Guid.Parse("e7fd7a7a-089e-4bbf-9018-4ffd11db0187"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("3279dffd-84e0-4756-b9e0-6a87e025edbc"),
                DateFromPlan = new DateTime(638141760000000000),
                SeamId = Guid.Parse("dfbf3824-def3-485b-b5af-66c0fcd1adca"),
                ProductAccountId = Guid.Parse("922415ed-0a30-4715-a1b2-c516a7306b8f"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("36828ae2-0410-4279-b1bb-67f512a24210"),
                DateFromPlan = new DateTime(638141760000000000),
                SeamId = Guid.Parse("b04049d0-5026-4014-bd26-e61dbd0bda14"),
                ProductAccountId = Guid.Parse("e7fd7a7a-089e-4bbf-9018-4ffd11db0187"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("398fcdf3-d382-4ba3-92ab-395b3135ccf1"),
                DateFromPlan = new DateTime(638141760000000000),
                SeamId = Guid.Parse("05d627b6-e193-4251-88b9-635cba1b9370"),
                ProductAccountId = Guid.Parse("c9006ce7-51a1-45d9-857f-fb00b95f98bf"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("3f9e0cbe-4b89-42bf-923f-89526cbd682f"),
                DateFromPlan = new DateTime(638141760000000000),
                SeamId = Guid.Parse("d8955c29-4257-4705-afc3-552316d0e8bf"),
                ProductAccountId = Guid.Parse("c9006ce7-51a1-45d9-857f-fb00b95f98bf"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("44d749e4-1554-478f-87df-e31d0bee3af2"),
                DateFromPlan = new DateTime(638141760000000000),
                SeamId = Guid.Parse("dc631901-db09-4add-9e04-3e5e006c2271"),
                ProductAccountId = Guid.Parse("1e91f7ef-29df-4a0b-90c5-0f35800b5fda"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("572e451f-944a-46d4-91c9-c1b05645ff82"),
                DateFromPlan = new DateTime(638141760000000000),
                SeamId = Guid.Parse("f43dc5cf-191d-4ba5-ab5f-5865f73589e0"),
                ProductAccountId = Guid.Parse("c9006ce7-51a1-45d9-857f-fb00b95f98bf"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("722650c1-d999-492f-a795-6692f0878f5d"),
                DateFromPlan = new DateTime(638141760000000000),
                SeamId = Guid.Parse("3e55080c-fc22-4c5a-ac4e-a0dc4cbb67e1"),
                ProductAccountId = Guid.Parse("922415ed-0a30-4715-a1b2-c516a7306b8f"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("77f692ec-1e8d-4dfc-b25c-b4c66fc59404"),
                DateFromPlan = new DateTime(638141760000000000),
                SeamId = Guid.Parse("c4309e97-a1e8-49de-b124-c1aa1e89de8a"),
                ProductAccountId = Guid.Parse("922415ed-0a30-4715-a1b2-c516a7306b8f"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("7f92d503-300d-42f7-99aa-092c1d36d969"),
                DateFromPlan = new DateTime(638141760000000000),
                SeamId = Guid.Parse("a3b759d7-555a-41ea-93bf-2d9c7ce48371"),
                ProductAccountId = Guid.Parse("c9006ce7-51a1-45d9-857f-fb00b95f98bf"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("8da2e1da-2b5d-41db-98a0-675e9ae8b816"),
                DateFromPlan = new DateTime(638141760000000000),
                SeamId = Guid.Parse("7d83ba4e-5b00-4935-baf1-df3ad86b15c8"),
                ProductAccountId = Guid.Parse("e7fd7a7a-089e-4bbf-9018-4ffd11db0187"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("8f448239-2ab1-4276-a3f5-a605d95625e4"),
                DateFromPlan = new DateTime(638141760000000000),
                SeamId = Guid.Parse("6eb38dfc-df1a-42c4-8b12-f9956cad632e"),
                ProductAccountId = Guid.Parse("1e91f7ef-29df-4a0b-90c5-0f35800b5fda"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("8f48b662-76ae-4d35-9d6e-05eaf954e83d"),
                DateFromPlan = new DateTime(638141760000000000),
                SeamId = Guid.Parse("c07e6c99-6ab0-4e57-8ea3-53bb68ffa507"),
                ProductAccountId = Guid.Parse("1e91f7ef-29df-4a0b-90c5-0f35800b5fda"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("a4c0bc87-26fd-45fe-a135-1169702387c0"),
                DateFromPlan = new DateTime(638141760000000000),
                SeamId = Guid.Parse("3af46b20-224a-4f72-97b6-5297d2b75bf5"),
                ProductAccountId = Guid.Parse("e7fd7a7a-089e-4bbf-9018-4ffd11db0187"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("acae688f-3fc8-47e7-8396-5dfaa74ae6b3"),
                DateFromPlan = new DateTime(638141760000000000),
                SeamId = Guid.Parse("b275eb65-ca76-4272-9662-d9b92e109177"),
                ProductAccountId = Guid.Parse("e7fd7a7a-089e-4bbf-9018-4ffd11db0187"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("c1a50c66-c72e-4cf7-9f4a-c0b540ae7b1e"),
                DateFromPlan = new DateTime(638141760000000000),
                SeamId = Guid.Parse("ace294ec-b133-4fcb-aca8-7bdefef745f1"),
                ProductAccountId = Guid.Parse("e7fd7a7a-089e-4bbf-9018-4ffd11db0187"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("e1ad50e6-3cce-498a-9c30-a125df2783ae"),
                DateFromPlan = new DateTime(638141760000000000),
                SeamId = Guid.Parse("1b6a85ad-6da0-4269-a86f-180ec363cb9e"),
                ProductAccountId = Guid.Parse("c9006ce7-51a1-45d9-857f-fb00b95f98bf"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("ea2dbfaf-a88b-4646-9444-f29592c84871"),
                DateFromPlan = new DateTime(638141760000000000),
                SeamId = Guid.Parse("b7703aeb-535a-4be2-a171-b71fbe3cec42"),
                ProductAccountId = Guid.Parse("c9006ce7-51a1-45d9-857f-fb00b95f98bf"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("0d7a8abe-5a68-4be0-a99d-63e2223e6d1f"),
                DateFromPlan = new DateTime(638175456000000000),
                SeamId = Guid.Parse("f43dc5cf-191d-4ba5-ab5f-5865f73589e0"),
                ProductAccountId = Guid.Parse("278c5233-0b66-4144-afdc-b45af2d868e5"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("15cc8a1f-2440-4bdd-9caf-846b3db51068"),
                DateFromPlan = new DateTime(638175456000000000),
                SeamId = Guid.Parse("b04049d0-5026-4014-bd26-e61dbd0bda14"),
                ProductAccountId = Guid.Parse("ecb64aac-a835-48f6-a785-fd38a746453a"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("1d660994-f74f-413b-9647-c21e15531079"),
                DateFromPlan = new DateTime(638175456000000000),
                SeamId = Guid.Parse("7d83ba4e-5b00-4935-baf1-df3ad86b15c8"),
                ProductAccountId = Guid.Parse("ecb64aac-a835-48f6-a785-fd38a746453a"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("27c80ed7-bf6f-4a6a-a1d8-9728a3aecfce"),
                DateFromPlan = new DateTime(638175456000000000),
                SeamId = Guid.Parse("c07e6c99-6ab0-4e57-8ea3-53bb68ffa507"),
                ProductAccountId = Guid.Parse("e089bfca-a7b3-4631-b974-b40ee7268c7a"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("3ac363fb-d192-485a-aa60-33b73951193a"),
                DateFromPlan = new DateTime(638175456000000000),
                SeamId = Guid.Parse("1b6a85ad-6da0-4269-a86f-180ec363cb9e"),
                ProductAccountId = Guid.Parse("278c5233-0b66-4144-afdc-b45af2d868e5"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("43517b65-b3ec-492f-801d-cff9b4a52b93"),
                DateFromPlan = new DateTime(638175456000000000),
                SeamId = Guid.Parse("3e55080c-fc22-4c5a-ac4e-a0dc4cbb67e1"),
                ProductAccountId = Guid.Parse("89026249-cc33-4ee3-a542-181e50e0e486"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("55e90118-e490-4e3c-90cc-38c85926aeb4"),
                DateFromPlan = new DateTime(638175456000000000),
                SeamId = Guid.Parse("3af46b20-224a-4f72-97b6-5297d2b75bf5"),
                ProductAccountId = Guid.Parse("ecb64aac-a835-48f6-a785-fd38a746453a"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("65578bcb-df3f-4641-ac75-d342cc933107"),
                DateFromPlan = new DateTime(638175456000000000),
                SeamId = Guid.Parse("c4309e97-a1e8-49de-b124-c1aa1e89de8a"),
                ProductAccountId = Guid.Parse("89026249-cc33-4ee3-a542-181e50e0e486"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("6b1e2b36-2ceb-4460-af6c-fb93186d12d4"),
                DateFromPlan = new DateTime(638175456000000000),
                SeamId = Guid.Parse("05d627b6-e193-4251-88b9-635cba1b9370"),
                ProductAccountId = Guid.Parse("278c5233-0b66-4144-afdc-b45af2d868e5"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("74c58713-2bec-4d4c-9887-2f4a6ffbb8dc"),
                DateFromPlan = new DateTime(638175456000000000),
                SeamId = Guid.Parse("a3b759d7-555a-41ea-93bf-2d9c7ce48371"),
                ProductAccountId = Guid.Parse("278c5233-0b66-4144-afdc-b45af2d868e5"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("8fa8094e-1d6a-46e9-a2a0-5145407d2870"),
                DateFromPlan = new DateTime(638175456000000000),
                SeamId = Guid.Parse("dfbf3824-def3-485b-b5af-66c0fcd1adca"),
                ProductAccountId = Guid.Parse("89026249-cc33-4ee3-a542-181e50e0e486"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("bd94c72e-730c-42a2-a8c4-b33937d189a7"),
                DateFromPlan = new DateTime(638175456000000000),
                SeamId = Guid.Parse("d8955c29-4257-4705-afc3-552316d0e8bf"),
                ProductAccountId = Guid.Parse("278c5233-0b66-4144-afdc-b45af2d868e5"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("d9dbd808-34ee-46d0-8ad9-c9396a845bf6"),
                DateFromPlan = new DateTime(638175456000000000),
                SeamId = Guid.Parse("6eb38dfc-df1a-42c4-8b12-f9956cad632e"),
                ProductAccountId = Guid.Parse("e089bfca-a7b3-4631-b974-b40ee7268c7a"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("d9ecbd82-d9f6-41df-8ebd-ee3b36b0afe1"),
                DateFromPlan = new DateTime(638175456000000000),
                SeamId = Guid.Parse("ace294ec-b133-4fcb-aca8-7bdefef745f1"),
                ProductAccountId = Guid.Parse("ecb64aac-a835-48f6-a785-fd38a746453a"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("da264e77-8bb1-4ca1-aedc-439232d050a6"),
                DateFromPlan = new DateTime(638175456000000000),
                SeamId = Guid.Parse("b275eb65-ca76-4272-9662-d9b92e109177"),
                ProductAccountId = Guid.Parse("ecb64aac-a835-48f6-a785-fd38a746453a"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("eabee1fe-082a-4e6f-afaf-e84918777617"),
                DateFromPlan = new DateTime(638175456000000000),
                SeamId = Guid.Parse("b7703aeb-535a-4be2-a171-b71fbe3cec42"),
                ProductAccountId = Guid.Parse("278c5233-0b66-4144-afdc-b45af2d868e5"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("f19ab689-f835-485f-af67-d41efa10f651"),
                DateFromPlan = new DateTime(638175456000000000),
                SeamId = Guid.Parse("03876726-8de8-486d-a01b-50b644cc76f1"),
                ProductAccountId = Guid.Parse("ecb64aac-a835-48f6-a785-fd38a746453a"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("f29418ab-5a27-47de-bea9-629e410ab4d1"),
                DateFromPlan = new DateTime(638175456000000000),
                SeamId = Guid.Parse("dc631901-db09-4add-9e04-3e5e006c2271"),
                ProductAccountId = Guid.Parse("e089bfca-a7b3-4631-b974-b40ee7268c7a"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("0d6ddde9-3469-4c4a-8dc3-74c3e07cb9b6"),
                DateFromPlan = new DateTime(638185824000000000),
                SeamId = Guid.Parse("a3b759d7-555a-41ea-93bf-2d9c7ce48371"),
                ProductAccountId = Guid.Parse("aed91b3d-b3d9-4340-9b6c-63a55199b0b6"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("0dfe2399-755a-4beb-b686-40214d966dd6"),
                DateFromPlan = new DateTime(638185824000000000),
                SeamId = Guid.Parse("b7703aeb-535a-4be2-a171-b71fbe3cec42"),
                ProductAccountId = Guid.Parse("aed91b3d-b3d9-4340-9b6c-63a55199b0b6"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("3d8e7c24-b67e-4ae6-ba9a-4bf6b3e7b6a3"),
                DateFromPlan = new DateTime(638185824000000000),
                SeamId = Guid.Parse("c4309e97-a1e8-49de-b124-c1aa1e89de8a"),
                ProductAccountId = Guid.Parse("4aa2e100-3238-453d-ae8e-18bc77821ece"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("51e700f7-d668-4ecc-b991-8fa66a395bba"),
                DateFromPlan = new DateTime(638185824000000000),
                SeamId = Guid.Parse("c07e6c99-6ab0-4e57-8ea3-53bb68ffa507"),
                ProductAccountId = Guid.Parse("49bdc8a7-b421-4300-82a4-c6df552860b3"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("54ff147e-247d-44b4-9dff-d854474ccd4a"),
                DateFromPlan = new DateTime(638185824000000000),
                SeamId = Guid.Parse("f43dc5cf-191d-4ba5-ab5f-5865f73589e0"),
                ProductAccountId = Guid.Parse("aed91b3d-b3d9-4340-9b6c-63a55199b0b6"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("58e244c2-a55f-4c69-90b6-163adfde277b"),
                DateFromPlan = new DateTime(638185824000000000),
                SeamId = Guid.Parse("b04049d0-5026-4014-bd26-e61dbd0bda14"),
                ProductAccountId = Guid.Parse("a7a06d59-183f-4821-8c03-34b3507c6c9c"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("5f69f15e-3071-4b0e-9db8-9f1ac8df2884"),
                DateFromPlan = new DateTime(638185824000000000),
                SeamId = Guid.Parse("ace294ec-b133-4fcb-aca8-7bdefef745f1"),
                ProductAccountId = Guid.Parse("a7a06d59-183f-4821-8c03-34b3507c6c9c"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("76d0a222-ba01-464d-ac10-d0b0e1443116"),
                DateFromPlan = new DateTime(638185824000000000),
                SeamId = Guid.Parse("d8955c29-4257-4705-afc3-552316d0e8bf"),
                ProductAccountId = Guid.Parse("aed91b3d-b3d9-4340-9b6c-63a55199b0b6"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("79ae86eb-f645-4b4b-9694-818f53de97e8"),
                DateFromPlan = new DateTime(638185824000000000),
                SeamId = Guid.Parse("05d627b6-e193-4251-88b9-635cba1b9370"),
                ProductAccountId = Guid.Parse("aed91b3d-b3d9-4340-9b6c-63a55199b0b6"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("8fba9a40-909c-4268-82a7-1913a1adfc21"),
                DateFromPlan = new DateTime(638185824000000000),
                SeamId = Guid.Parse("1b6a85ad-6da0-4269-a86f-180ec363cb9e"),
                ProductAccountId = Guid.Parse("aed91b3d-b3d9-4340-9b6c-63a55199b0b6"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("b82fa137-85b0-49e8-92cb-082495b9d328"),
                DateFromPlan = new DateTime(638185824000000000),
                SeamId = Guid.Parse("3af46b20-224a-4f72-97b6-5297d2b75bf5"),
                ProductAccountId = Guid.Parse("a7a06d59-183f-4821-8c03-34b3507c6c9c"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("cfba41ce-06a4-4877-9f66-d17efc17c1c1"),
                DateFromPlan = new DateTime(638185824000000000),
                SeamId = Guid.Parse("dc631901-db09-4add-9e04-3e5e006c2271"),
                ProductAccountId = Guid.Parse("49bdc8a7-b421-4300-82a4-c6df552860b3"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("dd3982b0-f157-449d-af7f-f5cc9cd829d7"),
                DateFromPlan = new DateTime(638185824000000000),
                SeamId = Guid.Parse("3e55080c-fc22-4c5a-ac4e-a0dc4cbb67e1"),
                ProductAccountId = Guid.Parse("4aa2e100-3238-453d-ae8e-18bc77821ece"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("de386b8e-4b04-4d4a-bf53-20099e645aa9"),
                DateFromPlan = new DateTime(638185824000000000),
                SeamId = Guid.Parse("dfbf3824-def3-485b-b5af-66c0fcd1adca"),
                ProductAccountId = Guid.Parse("4aa2e100-3238-453d-ae8e-18bc77821ece"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("e75725ce-9c6d-46cd-ae16-a86d4b822972"),
                DateFromPlan = new DateTime(638185824000000000),
                SeamId = Guid.Parse("b275eb65-ca76-4272-9662-d9b92e109177"),
                ProductAccountId = Guid.Parse("a7a06d59-183f-4821-8c03-34b3507c6c9c"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("f3824d86-0cc6-417e-9db8-100b736c56bb"),
                DateFromPlan = new DateTime(638185824000000000),
                SeamId = Guid.Parse("7d83ba4e-5b00-4935-baf1-df3ad86b15c8"),
                ProductAccountId = Guid.Parse("a7a06d59-183f-4821-8c03-34b3507c6c9c"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("f63125c1-acf5-4aaf-b553-516f331b8e32"),
                DateFromPlan = new DateTime(638185824000000000),
                SeamId = Guid.Parse("6eb38dfc-df1a-42c4-8b12-f9956cad632e"),
                ProductAccountId = Guid.Parse("49bdc8a7-b421-4300-82a4-c6df552860b3"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("ff1d28a6-7900-4218-92d4-dab56392fc1a"),
                DateFromPlan = new DateTime(638185824000000000),
                SeamId = Guid.Parse("03876726-8de8-486d-a01b-50b644cc76f1"),
                ProductAccountId = Guid.Parse("a7a06d59-183f-4821-8c03-34b3507c6c9c"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("14143820-3069-4af7-ac0e-9d718da05df6"),
                DateFromPlan = new DateTime(638186688000000000),
                SeamId = Guid.Parse("dc631901-db09-4add-9e04-3e5e006c2271"),
                ProductAccountId = Guid.Parse("3d5b760a-7e7e-41df-8be2-b1907d184af7"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("151ba506-323c-492f-8bc7-792c1a3a3261"),
                DateFromPlan = new DateTime(638186688000000000),
                SeamId = Guid.Parse("ace294ec-b133-4fcb-aca8-7bdefef745f1"),
                ProductAccountId = Guid.Parse("007c0696-7942-48dd-b487-8a27ec1a2205"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("1bfa9837-467e-442d-98bd-9222db9152f9"),
                DateFromPlan = new DateTime(638186688000000000),
                SeamId = Guid.Parse("1b6a85ad-6da0-4269-a86f-180ec363cb9e"),
                ProductAccountId = Guid.Parse("a83c8cbe-4557-4a22-bacf-a316c760e7b6"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("21009ef9-6b0e-418a-8254-0df8c40fdd26"),
                DateFromPlan = new DateTime(638186688000000000),
                SeamId = Guid.Parse("c4309e97-a1e8-49de-b124-c1aa1e89de8a"),
                ProductAccountId = Guid.Parse("bde7f54c-ad95-452c-a4e8-be272521a384"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("2ac04518-7a7e-4e36-b680-ee817d1eaa86"),
                DateFromPlan = new DateTime(638186688000000000),
                SeamId = Guid.Parse("05d627b6-e193-4251-88b9-635cba1b9370"),
                ProductAccountId = Guid.Parse("a83c8cbe-4557-4a22-bacf-a316c760e7b6"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("3e7c2f83-0fd0-4d2c-aa9e-442a68e924a0"),
                DateFromPlan = new DateTime(638186688000000000),
                SeamId = Guid.Parse("b04049d0-5026-4014-bd26-e61dbd0bda14"),
                ProductAccountId = Guid.Parse("007c0696-7942-48dd-b487-8a27ec1a2205"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("48f3abc9-fa36-48a7-a97c-6f6ddf6ed689"),
                DateFromPlan = new DateTime(638186688000000000),
                SeamId = Guid.Parse("3e55080c-fc22-4c5a-ac4e-a0dc4cbb67e1"),
                ProductAccountId = Guid.Parse("bde7f54c-ad95-452c-a4e8-be272521a384"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("6549760a-d9fb-4ea6-9efe-761552343255"),
                DateFromPlan = new DateTime(638186688000000000),
                SeamId = Guid.Parse("dfbf3824-def3-485b-b5af-66c0fcd1adca"),
                ProductAccountId = Guid.Parse("bde7f54c-ad95-452c-a4e8-be272521a384"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("68a29e4c-20aa-40da-8b43-be876fad5cc5"),
                DateFromPlan = new DateTime(638186688000000000),
                SeamId = Guid.Parse("03876726-8de8-486d-a01b-50b644cc76f1"),
                ProductAccountId = Guid.Parse("007c0696-7942-48dd-b487-8a27ec1a2205"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("71bf9c1d-5d26-41ef-9b92-33a9132c7b58"),
                DateFromPlan = new DateTime(638186688000000000),
                SeamId = Guid.Parse("d8955c29-4257-4705-afc3-552316d0e8bf"),
                ProductAccountId = Guid.Parse("a83c8cbe-4557-4a22-bacf-a316c760e7b6"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("76469742-0e97-4389-841b-abb858f149d5"),
                DateFromPlan = new DateTime(638186688000000000),
                SeamId = Guid.Parse("3af46b20-224a-4f72-97b6-5297d2b75bf5"),
                ProductAccountId = Guid.Parse("007c0696-7942-48dd-b487-8a27ec1a2205"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("86edd6d6-5fd3-40a9-81f1-dbfe1b36aa50"),
                DateFromPlan = new DateTime(638186688000000000),
                SeamId = Guid.Parse("f43dc5cf-191d-4ba5-ab5f-5865f73589e0"),
                ProductAccountId = Guid.Parse("a83c8cbe-4557-4a22-bacf-a316c760e7b6"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("91edd7a5-5447-4040-adc4-127a6b553075"),
                DateFromPlan = new DateTime(638186688000000000),
                SeamId = Guid.Parse("7d83ba4e-5b00-4935-baf1-df3ad86b15c8"),
                ProductAccountId = Guid.Parse("007c0696-7942-48dd-b487-8a27ec1a2205"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("91f6396d-95ab-44be-8889-c6c145f94bf5"),
                DateFromPlan = new DateTime(638186688000000000),
                SeamId = Guid.Parse("b7703aeb-535a-4be2-a171-b71fbe3cec42"),
                ProductAccountId = Guid.Parse("a83c8cbe-4557-4a22-bacf-a316c760e7b6"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("af93c5e6-f8c3-44b1-acbd-119d1b90bc65"),
                DateFromPlan = new DateTime(638186688000000000),
                SeamId = Guid.Parse("c07e6c99-6ab0-4e57-8ea3-53bb68ffa507"),
                ProductAccountId = Guid.Parse("3d5b760a-7e7e-41df-8be2-b1907d184af7"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("cb53464b-8c29-428c-9dbc-069124b2116a"),
                DateFromPlan = new DateTime(638186688000000000),
                SeamId = Guid.Parse("b275eb65-ca76-4272-9662-d9b92e109177"),
                ProductAccountId = Guid.Parse("007c0696-7942-48dd-b487-8a27ec1a2205"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("e1d7a081-fb5f-4a31-bc67-708375c6bf7f"),
                DateFromPlan = new DateTime(638186688000000000),
                SeamId = Guid.Parse("a3b759d7-555a-41ea-93bf-2d9c7ce48371"),
                ProductAccountId = Guid.Parse("a83c8cbe-4557-4a22-bacf-a316c760e7b6"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("ece10748-bd4d-4a24-8cd1-c3fe8e9679ed"),
                DateFromPlan = new DateTime(638186688000000000),
                SeamId = Guid.Parse("6eb38dfc-df1a-42c4-8b12-f9956cad632e"),
                ProductAccountId = Guid.Parse("3d5b760a-7e7e-41df-8be2-b1907d184af7"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("051a19c3-5628-4d43-b39a-4ad717946f5a"),
                DateFromPlan = new DateTime(638187552000000000),
                SeamId = Guid.Parse("7d83ba4e-5b00-4935-baf1-df3ad86b15c8"),
                ProductAccountId = Guid.Parse("4b5a29f7-2166-4200-961a-100d0dcc9919"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("2dc99950-6c7c-4ab0-9e02-f17a6fd935e6"),
                DateFromPlan = new DateTime(638187552000000000),
                SeamId = Guid.Parse("b04049d0-5026-4014-bd26-e61dbd0bda14"),
                ProductAccountId = Guid.Parse("4b5a29f7-2166-4200-961a-100d0dcc9919"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("53068f11-34a0-446d-b964-89e524add8e9"),
                DateFromPlan = new DateTime(638187552000000000),
                SeamId = Guid.Parse("a3b759d7-555a-41ea-93bf-2d9c7ce48371"),
                ProductAccountId = Guid.Parse("20af1dc0-ed6e-4ab3-9199-92650a60da89"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("5773e326-ab06-44c7-bc38-3763fecdabbe"),
                DateFromPlan = new DateTime(638187552000000000),
                SeamId = Guid.Parse("b7703aeb-535a-4be2-a171-b71fbe3cec42"),
                ProductAccountId = Guid.Parse("20af1dc0-ed6e-4ab3-9199-92650a60da89"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("680dda85-9fba-4977-851d-245d2820fcdd"),
                DateFromPlan = new DateTime(638187552000000000),
                SeamId = Guid.Parse("1b6a85ad-6da0-4269-a86f-180ec363cb9e"),
                ProductAccountId = Guid.Parse("20af1dc0-ed6e-4ab3-9199-92650a60da89"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("68511386-69a6-4feb-ab7d-279c52044b9c"),
                DateFromPlan = new DateTime(638187552000000000),
                SeamId = Guid.Parse("c4309e97-a1e8-49de-b124-c1aa1e89de8a"),
                ProductAccountId = Guid.Parse("6cc80ba9-c787-4d50-9026-0bc1dc3c0544"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("6ca44b0b-ea70-470f-a1d3-c167af181f0f"),
                DateFromPlan = new DateTime(638187552000000000),
                SeamId = Guid.Parse("6eb38dfc-df1a-42c4-8b12-f9956cad632e"),
                ProductAccountId = Guid.Parse("bc01e57b-b032-4f76-8f9d-9ef3f88de853"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("79136e84-eb07-4594-b806-38f627cf295c"),
                DateFromPlan = new DateTime(638187552000000000),
                SeamId = Guid.Parse("c07e6c99-6ab0-4e57-8ea3-53bb68ffa507"),
                ProductAccountId = Guid.Parse("bc01e57b-b032-4f76-8f9d-9ef3f88de853"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("815ea51d-c562-4deb-a3e6-c41b8973e16c"),
                DateFromPlan = new DateTime(638187552000000000),
                SeamId = Guid.Parse("ace294ec-b133-4fcb-aca8-7bdefef745f1"),
                ProductAccountId = Guid.Parse("4b5a29f7-2166-4200-961a-100d0dcc9919"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("8496be09-574c-4735-a0c4-69a0466c3a03"),
                DateFromPlan = new DateTime(638187552000000000),
                SeamId = Guid.Parse("3af46b20-224a-4f72-97b6-5297d2b75bf5"),
                ProductAccountId = Guid.Parse("4b5a29f7-2166-4200-961a-100d0dcc9919"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("a3ec12f4-0cb9-4fab-9dba-ddeb90011ae6"),
                DateFromPlan = new DateTime(638187552000000000),
                SeamId = Guid.Parse("f43dc5cf-191d-4ba5-ab5f-5865f73589e0"),
                ProductAccountId = Guid.Parse("20af1dc0-ed6e-4ab3-9199-92650a60da89"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("a57e6340-096c-4afa-a362-568ec2782600"),
                DateFromPlan = new DateTime(638187552000000000),
                SeamId = Guid.Parse("03876726-8de8-486d-a01b-50b644cc76f1"),
                ProductAccountId = Guid.Parse("4b5a29f7-2166-4200-961a-100d0dcc9919"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("aa96fe2f-d9e8-4e3e-bef3-6744554d45ad"),
                DateFromPlan = new DateTime(638187552000000000),
                SeamId = Guid.Parse("dc631901-db09-4add-9e04-3e5e006c2271"),
                ProductAccountId = Guid.Parse("bc01e57b-b032-4f76-8f9d-9ef3f88de853"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("abbe7f4d-d427-4428-91b3-3cff32760fec"),
                DateFromPlan = new DateTime(638187552000000000),
                SeamId = Guid.Parse("05d627b6-e193-4251-88b9-635cba1b9370"),
                ProductAccountId = Guid.Parse("20af1dc0-ed6e-4ab3-9199-92650a60da89"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("bf9c2b23-4540-4fc4-8e3b-61c18bfdecae"),
                DateFromPlan = new DateTime(638187552000000000),
                SeamId = Guid.Parse("dfbf3824-def3-485b-b5af-66c0fcd1adca"),
                ProductAccountId = Guid.Parse("6cc80ba9-c787-4d50-9026-0bc1dc3c0544"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("ef2c7559-5207-422b-b597-9512072b5321"),
                DateFromPlan = new DateTime(638187552000000000),
                SeamId = Guid.Parse("d8955c29-4257-4705-afc3-552316d0e8bf"),
                ProductAccountId = Guid.Parse("20af1dc0-ed6e-4ab3-9199-92650a60da89"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("f2c7a58a-a9f6-4489-94a5-7549ce07efdd"),
                DateFromPlan = new DateTime(638187552000000000),
                SeamId = Guid.Parse("3e55080c-fc22-4c5a-ac4e-a0dc4cbb67e1"),
                ProductAccountId = Guid.Parse("6cc80ba9-c787-4d50-9026-0bc1dc3c0544"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("fb19a111-0bdf-474f-8d1d-8dcc3c7fc078"),
                DateFromPlan = new DateTime(638187552000000000),
                SeamId = Guid.Parse("b275eb65-ca76-4272-9662-d9b92e109177"),
                ProductAccountId = Guid.Parse("4b5a29f7-2166-4200-961a-100d0dcc9919"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("29c11d8b-d2be-42a0-a4cd-238fd3ccc604"),
                DateFromPlan = new DateTime(638188416000000000),
                SeamId = Guid.Parse("c4309e97-a1e8-49de-b124-c1aa1e89de8a"),
                ProductAccountId = Guid.Parse("a4767a7f-aa04-4045-85b5-7a1a2d974546"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("2a003b51-f5ea-4647-826d-c4874ffd0376"),
                DateFromPlan = new DateTime(638188416000000000),
                SeamId = Guid.Parse("3af46b20-224a-4f72-97b6-5297d2b75bf5"),
                ProductAccountId = Guid.Parse("b41e536d-aac0-4b63-a4e7-62498a5576b8"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("46d533fa-acc5-4ec7-ab36-7afee024020b"),
                DateFromPlan = new DateTime(638188416000000000),
                SeamId = Guid.Parse("ace294ec-b133-4fcb-aca8-7bdefef745f1"),
                ProductAccountId = Guid.Parse("b41e536d-aac0-4b63-a4e7-62498a5576b8"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("4db44c6a-636a-49be-9669-e8d244263829"),
                DateFromPlan = new DateTime(638188416000000000),
                SeamId = Guid.Parse("6eb38dfc-df1a-42c4-8b12-f9956cad632e"),
                ProductAccountId = Guid.Parse("15f17c40-c7b8-48cf-95cc-e691b6765e10"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("4f47479e-4b0c-406c-b76d-a5d149d53083"),
                DateFromPlan = new DateTime(638188416000000000),
                SeamId = Guid.Parse("f43dc5cf-191d-4ba5-ab5f-5865f73589e0"),
                ProductAccountId = Guid.Parse("58d52329-bb4d-4cca-bcf5-2b4ff8fe3b90"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("55743587-e5d6-49b4-9384-6466d6b19f80"),
                DateFromPlan = new DateTime(638188416000000000),
                SeamId = Guid.Parse("3e55080c-fc22-4c5a-ac4e-a0dc4cbb67e1"),
                ProductAccountId = Guid.Parse("a4767a7f-aa04-4045-85b5-7a1a2d974546"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("674b652d-2065-48b7-bf89-aacc430ea1db"),
                DateFromPlan = new DateTime(638188416000000000),
                SeamId = Guid.Parse("1b6a85ad-6da0-4269-a86f-180ec363cb9e"),
                ProductAccountId = Guid.Parse("58d52329-bb4d-4cca-bcf5-2b4ff8fe3b90"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("70e49a41-7c35-496d-b60b-291450133659"),
                DateFromPlan = new DateTime(638188416000000000),
                SeamId = Guid.Parse("d8955c29-4257-4705-afc3-552316d0e8bf"),
                ProductAccountId = Guid.Parse("58d52329-bb4d-4cca-bcf5-2b4ff8fe3b90"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("853fd777-78b5-49ef-baee-12025f00b4c3"),
                DateFromPlan = new DateTime(638188416000000000),
                SeamId = Guid.Parse("7d83ba4e-5b00-4935-baf1-df3ad86b15c8"),
                ProductAccountId = Guid.Parse("b41e536d-aac0-4b63-a4e7-62498a5576b8"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("9d5ad775-da4f-4f31-b637-fee1e6a7052c"),
                DateFromPlan = new DateTime(638188416000000000),
                SeamId = Guid.Parse("c07e6c99-6ab0-4e57-8ea3-53bb68ffa507"),
                ProductAccountId = Guid.Parse("15f17c40-c7b8-48cf-95cc-e691b6765e10"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("a8058edc-ada6-411d-8cf5-a5888f033de4"),
                DateFromPlan = new DateTime(638188416000000000),
                SeamId = Guid.Parse("dfbf3824-def3-485b-b5af-66c0fcd1adca"),
                ProductAccountId = Guid.Parse("a4767a7f-aa04-4045-85b5-7a1a2d974546"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("b76c4260-0d58-4376-b624-1a8a0bf017aa"),
                DateFromPlan = new DateTime(638188416000000000),
                SeamId = Guid.Parse("b275eb65-ca76-4272-9662-d9b92e109177"),
                ProductAccountId = Guid.Parse("b41e536d-aac0-4b63-a4e7-62498a5576b8"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("e4f94509-e1e9-43d3-9cc2-f2be46eaee26"),
                DateFromPlan = new DateTime(638188416000000000),
                SeamId = Guid.Parse("b7703aeb-535a-4be2-a171-b71fbe3cec42"),
                ProductAccountId = Guid.Parse("58d52329-bb4d-4cca-bcf5-2b4ff8fe3b90"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("e9b5c1b8-a581-4d79-bca7-42f54efa2714"),
                DateFromPlan = new DateTime(638188416000000000),
                SeamId = Guid.Parse("b04049d0-5026-4014-bd26-e61dbd0bda14"),
                ProductAccountId = Guid.Parse("b41e536d-aac0-4b63-a4e7-62498a5576b8"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("edee3016-a2ae-4356-a6d5-d0d60cb2674d"),
                DateFromPlan = new DateTime(638188416000000000),
                SeamId = Guid.Parse("a3b759d7-555a-41ea-93bf-2d9c7ce48371"),
                ProductAccountId = Guid.Parse("58d52329-bb4d-4cca-bcf5-2b4ff8fe3b90"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("ee7b9c7f-1df5-45d4-ae67-cf9e5d0a6ce5"),
                DateFromPlan = new DateTime(638188416000000000),
                SeamId = Guid.Parse("05d627b6-e193-4251-88b9-635cba1b9370"),
                ProductAccountId = Guid.Parse("58d52329-bb4d-4cca-bcf5-2b4ff8fe3b90"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("f357d00e-f14d-4b9c-8f5c-e0e8235e2648"),
                DateFromPlan = new DateTime(638188416000000000),
                SeamId = Guid.Parse("03876726-8de8-486d-a01b-50b644cc76f1"),
                ProductAccountId = Guid.Parse("b41e536d-aac0-4b63-a4e7-62498a5576b8"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("fcbb9b82-b30c-4ff4-8f81-c5e42f84b6a9"),
                DateFromPlan = new DateTime(638188416000000000),
                SeamId = Guid.Parse("dc631901-db09-4add-9e04-3e5e006c2271"),
                ProductAccountId = Guid.Parse("15f17c40-c7b8-48cf-95cc-e691b6765e10"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("0bf54632-e454-4249-a9d8-20214a2a2717"),
                DateFromPlan = new DateTime(638192736000000000),
                SeamId = Guid.Parse("b7703aeb-535a-4be2-a171-b71fbe3cec42"),
                ProductAccountId = Guid.Parse("90e8eaee-b343-4a1a-bf0f-80b94eeefb43"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("0e891569-280e-43ac-affd-6a9f769ca8ff"),
                DateFromPlan = new DateTime(638192736000000000),
                SeamId = Guid.Parse("c07e6c99-6ab0-4e57-8ea3-53bb68ffa507"),
                ProductAccountId = Guid.Parse("8e56b836-6929-4ecf-b7ea-a0b7d8f9dd81"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("11d1254a-2e8e-49eb-afa4-3f92164e6922"),
                DateFromPlan = new DateTime(638192736000000000),
                SeamId = Guid.Parse("7d83ba4e-5b00-4935-baf1-df3ad86b15c8"),
                ProductAccountId = Guid.Parse("23949c10-258c-4603-8369-ba77fa1660f9"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("1a2e812f-6974-44f6-b63d-2aed7ec9ab69"),
                DateFromPlan = new DateTime(638192736000000000),
                SeamId = Guid.Parse("05d627b6-e193-4251-88b9-635cba1b9370"),
                ProductAccountId = Guid.Parse("90e8eaee-b343-4a1a-bf0f-80b94eeefb43"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("5c33fcfe-c6eb-4be9-9a7e-831e417d3281"),
                DateFromPlan = new DateTime(638192736000000000),
                SeamId = Guid.Parse("c4309e97-a1e8-49de-b124-c1aa1e89de8a"),
                ProductAccountId = Guid.Parse("433f7da5-156f-453b-af97-789fb128ca18"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("68e4b32f-2c25-403c-b306-cac21c64a3dd"),
                DateFromPlan = new DateTime(638192736000000000),
                SeamId = Guid.Parse("1b6a85ad-6da0-4269-a86f-180ec363cb9e"),
                ProductAccountId = Guid.Parse("90e8eaee-b343-4a1a-bf0f-80b94eeefb43"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("79d3738d-3b47-4bf7-92ea-a93312929968"),
                DateFromPlan = new DateTime(638192736000000000),
                SeamId = Guid.Parse("dfbf3824-def3-485b-b5af-66c0fcd1adca"),
                ProductAccountId = Guid.Parse("433f7da5-156f-453b-af97-789fb128ca18"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("8b0f2eb4-19fa-4449-b79d-e1649e67322a"),
                DateFromPlan = new DateTime(638192736000000000),
                SeamId = Guid.Parse("b275eb65-ca76-4272-9662-d9b92e109177"),
                ProductAccountId = Guid.Parse("23949c10-258c-4603-8369-ba77fa1660f9"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("97c39db1-23a3-43bb-87a0-ab4fde96797b"),
                DateFromPlan = new DateTime(638192736000000000),
                SeamId = Guid.Parse("3af46b20-224a-4f72-97b6-5297d2b75bf5"),
                ProductAccountId = Guid.Parse("23949c10-258c-4603-8369-ba77fa1660f9"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("b2bd3679-74a4-4bf3-9b1f-42526f9871e5"),
                DateFromPlan = new DateTime(638192736000000000),
                SeamId = Guid.Parse("03876726-8de8-486d-a01b-50b644cc76f1"),
                ProductAccountId = Guid.Parse("23949c10-258c-4603-8369-ba77fa1660f9"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("b6e312dd-7e3b-42a1-9548-615c0a1cdd8b"),
                DateFromPlan = new DateTime(638192736000000000),
                SeamId = Guid.Parse("f43dc5cf-191d-4ba5-ab5f-5865f73589e0"),
                ProductAccountId = Guid.Parse("90e8eaee-b343-4a1a-bf0f-80b94eeefb43"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("ba63db71-0bb5-433a-98dc-8165cecf78ad"),
                DateFromPlan = new DateTime(638192736000000000),
                SeamId = Guid.Parse("6eb38dfc-df1a-42c4-8b12-f9956cad632e"),
                ProductAccountId = Guid.Parse("8e56b836-6929-4ecf-b7ea-a0b7d8f9dd81"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("c3502697-fe6a-4c08-bc9d-4000507f94ec"),
                DateFromPlan = new DateTime(638192736000000000),
                SeamId = Guid.Parse("d8955c29-4257-4705-afc3-552316d0e8bf"),
                ProductAccountId = Guid.Parse("90e8eaee-b343-4a1a-bf0f-80b94eeefb43"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("cbd7b07d-08af-4f95-bf87-6456a7a134cf"),
                DateFromPlan = new DateTime(638192736000000000),
                SeamId = Guid.Parse("b04049d0-5026-4014-bd26-e61dbd0bda14"),
                ProductAccountId = Guid.Parse("23949c10-258c-4603-8369-ba77fa1660f9"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("e743a948-677b-4b19-a77a-1bf8bd13ac27"),
                DateFromPlan = new DateTime(638192736000000000),
                SeamId = Guid.Parse("dc631901-db09-4add-9e04-3e5e006c2271"),
                ProductAccountId = Guid.Parse("8e56b836-6929-4ecf-b7ea-a0b7d8f9dd81"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("eee79665-3549-4720-92dd-2b2d8c91810b"),
                DateFromPlan = new DateTime(638192736000000000),
                SeamId = Guid.Parse("a3b759d7-555a-41ea-93bf-2d9c7ce48371"),
                ProductAccountId = Guid.Parse("90e8eaee-b343-4a1a-bf0f-80b94eeefb43"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("ef50323e-c4e5-463c-b10e-1cdd821ba51d"),
                DateFromPlan = new DateTime(638192736000000000),
                SeamId = Guid.Parse("ace294ec-b133-4fcb-aca8-7bdefef745f1"),
                ProductAccountId = Guid.Parse("23949c10-258c-4603-8369-ba77fa1660f9"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("f041bce5-7e21-482b-a31a-40f30ddc5687"),
                DateFromPlan = new DateTime(638192736000000000),
                SeamId = Guid.Parse("3e55080c-fc22-4c5a-ac4e-a0dc4cbb67e1"),
                ProductAccountId = Guid.Parse("433f7da5-156f-453b-af97-789fb128ca18"),
            },
        };

        return seamAccounts;
    }

    public static List<SeamResult> GenerateSeamResults()
    {
        var seamResults = new List<SeamResult>
        {
            new SeamResult
            {
                Id = Guid.Parse("02fcb317-14de-41da-9a34-c5fe7e2b7f50"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("398fcdf3-d382-4ba3-92ab-395b3135ccf1"),
            },
            new SeamResult
            {
                Id = Guid.Parse("046c3e3c-7f85-43dd-8601-b04e42909d58"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("ea2dbfaf-a88b-4646-9444-f29592c84871"),
            },
            new SeamResult
            {
                Id = Guid.Parse("0b087319-87ab-4384-9819-2d296f72d8b9"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("8f48b662-76ae-4d35-9d6e-05eaf954e83d"),
            },
            new SeamResult
            {
                Id = Guid.Parse("0d181a76-527b-4a4f-ae82-fe8b9c9ed647"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("c1a50c66-c72e-4cf7-9f4a-c0b540ae7b1e"),
            },
            new SeamResult
            {
                Id = Guid.Parse("0fd3abad-75d0-478b-853a-50d68bd9a995"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("e1ad50e6-3cce-498a-9c30-a125df2783ae"),
            },
            new SeamResult
            {
                Id = Guid.Parse("16c16cce-8ae2-446f-a89f-887ddd47c8f3"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("44d749e4-1554-478f-87df-e31d0bee3af2"),
            },
            new SeamResult
            {
                Id = Guid.Parse("1731c4e0-9a2a-4b95-9ec8-dac6b4a03cdf"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("3279dffd-84e0-4756-b9e0-6a87e025edbc"),
            },
            new SeamResult
            {
                Id = Guid.Parse("1c4fcbd2-e497-42cb-8c26-9b918f803f76"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("398fcdf3-d382-4ba3-92ab-395b3135ccf1"),
            },
            new SeamResult
            {
                Id = Guid.Parse("20d34612-b9f6-4c67-9507-c5143b28fcdd"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("a4c0bc87-26fd-45fe-a135-1169702387c0"),
            },
            new SeamResult
            {
                Id = Guid.Parse("2291f58b-b6b7-40bf-aa74-3b635e9c7b3c"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("acae688f-3fc8-47e7-8396-5dfaa74ae6b3"),
            },
            new SeamResult
            {
                Id = Guid.Parse("23771ae3-3ab7-4754-bc30-9476071e92ae"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("3f9e0cbe-4b89-42bf-923f-89526cbd682f"),
            },
            new SeamResult
            {
                Id = Guid.Parse("29f78160-767e-4272-beb8-ef8284a6b716"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("acae688f-3fc8-47e7-8396-5dfaa74ae6b3"),
            },
            new SeamResult
            {
                Id = Guid.Parse("2eb633e9-83f9-4d0e-87e7-d33b84fe2ded"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("8da2e1da-2b5d-41db-98a0-675e9ae8b816"),
            },
            new SeamResult
            {
                Id = Guid.Parse("368ec6c0-9a96-4e75-b029-7b9af043f501"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("ea2dbfaf-a88b-4646-9444-f29592c84871"),
            },
            new SeamResult
            {
                Id = Guid.Parse("37f104cf-5c21-4fda-a882-b94ba6794e76"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("8da2e1da-2b5d-41db-98a0-675e9ae8b816"),
            },
            new SeamResult
            {
                Id = Guid.Parse("43ad0214-ea37-457c-a46d-3505dad45a6f"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("7f92d503-300d-42f7-99aa-092c1d36d969"),
            },
            new SeamResult
            {
                Id = Guid.Parse("4a06bc38-5fb7-4405-a331-35fd75ff98ca"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("44d749e4-1554-478f-87df-e31d0bee3af2"),
            },
            new SeamResult
            {
                Id = Guid.Parse("5624088d-acc9-4e40-a68f-9168e337a5b8"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("36828ae2-0410-4279-b1bb-67f512a24210"),
            },
            new SeamResult
            {
                Id = Guid.Parse("58b96bd4-6eda-4719-aadb-0377c82137a6"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("091df164-48ab-4961-a22b-1d872a61daac"),
            },
            new SeamResult
            {
                Id = Guid.Parse("7090164d-82f5-44df-8429-4b981f3a060f"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("091df164-48ab-4961-a22b-1d872a61daac"),
            },
            new SeamResult
            {
                Id = Guid.Parse("7612ba9f-7916-4591-81f3-c87e5cc42de1"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("77f692ec-1e8d-4dfc-b25c-b4c66fc59404"),
            },
            new SeamResult
            {
                Id = Guid.Parse("771c9929-7a2b-488e-824b-d45fc06b4504"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("8f448239-2ab1-4276-a3f5-a605d95625e4"),
            },
            new SeamResult
            {
                Id = Guid.Parse("7fd46f47-70a1-4dde-811b-d0dfabd7a5fd"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("acae688f-3fc8-47e7-8396-5dfaa74ae6b3"),
            },
            new SeamResult
            {
                Id = Guid.Parse("80c6080e-9ee0-4e70-bc8d-d7255a09644f"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("3f9e0cbe-4b89-42bf-923f-89526cbd682f"),
            },
            new SeamResult
            {
                Id = Guid.Parse("88882ba9-06ab-4110-b608-a7fefcd9a715"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("a4c0bc87-26fd-45fe-a135-1169702387c0"),
            },
            new SeamResult
            {
                Id = Guid.Parse("8907611d-1cbc-4240-9751-4bfdb9bac019"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("a4c0bc87-26fd-45fe-a135-1169702387c0"),
            },
            new SeamResult
            {
                Id = Guid.Parse("8afa9d8e-e0b4-48c1-8c39-308b017b33c1"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("722650c1-d999-492f-a795-6692f0878f5d"),
            },
            new SeamResult
            {
                Id = Guid.Parse("8bf9175b-ba47-49d9-87e9-82204dedb215"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("36828ae2-0410-4279-b1bb-67f512a24210"),
            },
            new SeamResult
            {
                Id = Guid.Parse("92024960-1a7a-4302-bf8e-6ec4317a6ba8"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("ea2dbfaf-a88b-4646-9444-f29592c84871"),
            },
            new SeamResult
            {
                Id = Guid.Parse("9500195d-9958-4ee8-b919-6481321c79c7"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("c1a50c66-c72e-4cf7-9f4a-c0b540ae7b1e"),
            },
            new SeamResult
            {
                Id = Guid.Parse("96dcac81-924e-4aba-ad9c-aeb7884f3597"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("7f92d503-300d-42f7-99aa-092c1d36d969"),
            },
            new SeamResult
            {
                Id = Guid.Parse("9f1c8006-7791-4cc4-b4f5-ec0372d8ea8e"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("8f448239-2ab1-4276-a3f5-a605d95625e4"),
            },
            new SeamResult
            {
                Id = Guid.Parse("9f669316-94ae-41e6-a4a0-e0628a3dd195"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("722650c1-d999-492f-a795-6692f0878f5d"),
            },
            new SeamResult
            {
                Id = Guid.Parse("a08f3341-1b6a-45bc-865f-8fe3b4a3cb5a"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("722650c1-d999-492f-a795-6692f0878f5d"),
            },
            new SeamResult
            {
                Id = Guid.Parse("a2a066c1-abfc-43b3-8b4d-42fcf4de3f06"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("3279dffd-84e0-4756-b9e0-6a87e025edbc"),
            },
            new SeamResult
            {
                Id = Guid.Parse("aa7a096b-f411-4cd7-8146-b4abf4408949"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("572e451f-944a-46d4-91c9-c1b05645ff82"),
            },
            new SeamResult
            {
                Id = Guid.Parse("ac542d14-0162-4e69-a8f5-d8cc0343c6ab"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("44d749e4-1554-478f-87df-e31d0bee3af2"),
            },
            new SeamResult
            {
                Id = Guid.Parse("b4c2a187-8048-47ad-8cad-6f2dbc00712b"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("77f692ec-1e8d-4dfc-b25c-b4c66fc59404"),
            },
            new SeamResult
            {
                Id = Guid.Parse("bf2238ca-ef98-45fb-92cf-59b127a60d95"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("3f9e0cbe-4b89-42bf-923f-89526cbd682f"),
            },
            new SeamResult
            {
                Id = Guid.Parse("c38c15da-af09-49cc-941f-8b104ead8818"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("7f92d503-300d-42f7-99aa-092c1d36d969"),
            },
            new SeamResult
            {
                Id = Guid.Parse("c825e763-f46c-4431-96a7-9e355f5a5d98"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("572e451f-944a-46d4-91c9-c1b05645ff82"),
            },
            new SeamResult
            {
                Id = Guid.Parse("cb4884a4-4ae0-4ea8-a9df-6f8285a8ff72"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("77f692ec-1e8d-4dfc-b25c-b4c66fc59404"),
            },
            new SeamResult
            {
                Id = Guid.Parse("cc65bc34-0a9a-4b94-a008-8aefc98ca135"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("091df164-48ab-4961-a22b-1d872a61daac"),
            },
            new SeamResult
            {
                Id = Guid.Parse("ccfc3132-a911-4576-a547-4696a313b84e"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("8f48b662-76ae-4d35-9d6e-05eaf954e83d"),
            },
            new SeamResult
            {
                Id = Guid.Parse("df46e4e9-7d2d-408e-afeb-95b2a035b922"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("398fcdf3-d382-4ba3-92ab-395b3135ccf1"),
            },
            new SeamResult
            {
                Id = Guid.Parse("e54e5d04-ae7c-4112-a653-1730630510fb"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("8f48b662-76ae-4d35-9d6e-05eaf954e83d"),
            },
            new SeamResult
            {
                Id = Guid.Parse("ea7d9713-4650-4f44-96ff-72122775942e"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("e1ad50e6-3cce-498a-9c30-a125df2783ae"),
            },
            new SeamResult
            {
                Id = Guid.Parse("ecd18312-65f1-4047-8cd2-5d8cf2a53c83"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("3279dffd-84e0-4756-b9e0-6a87e025edbc"),
            },
            new SeamResult
            {
                Id = Guid.Parse("f39b468c-251e-48c3-9292-40395a349341"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("c1a50c66-c72e-4cf7-9f4a-c0b540ae7b1e"),
            },
            new SeamResult
            {
                Id = Guid.Parse("f3e0b1a3-8d04-482e-8971-1c4b8e752df1"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("8da2e1da-2b5d-41db-98a0-675e9ae8b816"),
            },
            new SeamResult
            {
                Id = Guid.Parse("f46b1555-5786-4069-a165-61c92545f90f"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("e1ad50e6-3cce-498a-9c30-a125df2783ae"),
            },
            new SeamResult
            {
                Id = Guid.Parse("f769fbd0-38ec-48d7-a684-ff21dbae16ab"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("8f448239-2ab1-4276-a3f5-a605d95625e4"),
            },
            new SeamResult
            {
                Id = Guid.Parse("fcea9b6e-c835-4733-ac64-3547dea0fa40"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("572e451f-944a-46d4-91c9-c1b05645ff82"),
            },
            new SeamResult
            {
                Id = Guid.Parse("ff35c0da-3691-42b1-940f-0f1fe4877c80"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("36828ae2-0410-4279-b1bb-67f512a24210"),
            },
            new SeamResult
            {
                Id = Guid.Parse("01dcc33f-025e-4102-8ec8-4e4993384c8a"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("bd94c72e-730c-42a2-a8c4-b33937d189a7"),
            },
            new SeamResult
            {
                Id = Guid.Parse("14b01dbf-7c03-40f0-93b0-ee30f3d75439"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("6b1e2b36-2ceb-4460-af6c-fb93186d12d4"),
            },
            new SeamResult
            {
                Id = Guid.Parse("18b2f74b-f0d0-48e5-99d1-cec6ad5a2295"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("27c80ed7-bf6f-4a6a-a1d8-9728a3aecfce"),
            },
            new SeamResult
            {
                Id = Guid.Parse("1e5ec218-c7eb-4a88-8d42-934ca0a40a07"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("1d660994-f74f-413b-9647-c21e15531079"),
            },
            new SeamResult
            {
                Id = Guid.Parse("1f721663-22b1-490b-9ae6-cc6c23b05d0f"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("f29418ab-5a27-47de-bea9-629e410ab4d1"),
            },
            new SeamResult
            {
                Id = Guid.Parse("2348a3a5-9bec-431f-b21e-8fb5eebc018a"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("15cc8a1f-2440-4bdd-9caf-846b3db51068"),
            },
            new SeamResult
            {
                Id = Guid.Parse("24369cfd-2414-4c2b-97e6-b909a66ea1ae"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("74c58713-2bec-4d4c-9887-2f4a6ffbb8dc"),
            },
            new SeamResult
            {
                Id = Guid.Parse("3418433d-4210-45d8-b678-50d2092e4828"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("55e90118-e490-4e3c-90cc-38c85926aeb4"),
            },
            new SeamResult
            {
                Id = Guid.Parse("5ea19351-22cf-4c83-b223-2d7740719be9"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("da264e77-8bb1-4ca1-aedc-439232d050a6"),
            },
            new SeamResult
            {
                Id = Guid.Parse("6a25d359-35f7-4edd-beff-7620a3d99015"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("0d7a8abe-5a68-4be0-a99d-63e2223e6d1f"),
            },
            new SeamResult
            {
                Id = Guid.Parse("6bec6ded-2f69-4306-a171-7dde6a623a9c"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("43517b65-b3ec-492f-801d-cff9b4a52b93"),
            },
            new SeamResult
            {
                Id = Guid.Parse("6f1933c4-6add-4a4f-bbce-fd58552164a1"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("d9dbd808-34ee-46d0-8ad9-c9396a845bf6"),
            },
            new SeamResult
            {
                Id = Guid.Parse("7a3e054c-8cde-469e-86d3-a290309ec61c"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("8fa8094e-1d6a-46e9-a2a0-5145407d2870"),
            },
            new SeamResult
            {
                Id = Guid.Parse("9b00f5b4-6432-4ee0-aa06-221c6ae34f8c"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("65578bcb-df3f-4641-ac75-d342cc933107"),
            },
            new SeamResult
            {
                Id = Guid.Parse("bbd8768b-07cf-4765-a985-8f24a965be57"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("d9ecbd82-d9f6-41df-8ebd-ee3b36b0afe1"),
            },
            new SeamResult
            {
                Id = Guid.Parse("c3721f25-2532-440a-88f1-7ef75c7409b0"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("f19ab689-f835-485f-af67-d41efa10f651"),
            },
            new SeamResult
            {
                Id = Guid.Parse("d0104af8-fe24-4ce3-a0cb-e39277a90baf"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("eabee1fe-082a-4e6f-afaf-e84918777617"),
            },
            new SeamResult
            {
                Id = Guid.Parse("d40703d0-42f4-4535-bad6-e553d3f59359"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("3ac363fb-d192-485a-aa60-33b73951193a"),
            },
            new SeamResult
            {
                Id = Guid.Parse("2318c224-f0b7-4747-b86f-9f1393ee7fcd"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("0d7a8abe-5a68-4be0-a99d-63e2223e6d1f"),
            },
            new SeamResult
            {
                Id = Guid.Parse("5e01aa4e-eb98-480b-8a3a-b124f1d69a5e"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("6b1e2b36-2ceb-4460-af6c-fb93186d12d4"),
            },
            new SeamResult
            {
                Id = Guid.Parse("67b67c82-a012-4001-9ffb-42c6b3b30990"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("bd94c72e-730c-42a2-a8c4-b33937d189a7"),
            },
            new SeamResult
            {
                Id = Guid.Parse("288a7ff6-535d-45dc-9eee-be03bab910ab"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("f19ab689-f835-485f-af67-d41efa10f651"),
            },
            new SeamResult
            {
                Id = Guid.Parse("6a80d3b3-98e5-4e2d-82b3-debe938f1caf"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("55e90118-e490-4e3c-90cc-38c85926aeb4"),
            },
            new SeamResult
            {
                Id = Guid.Parse("85ca8e74-ab58-4753-bb6b-61f6b905147e"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("1d660994-f74f-413b-9647-c21e15531079"),
            },
            new SeamResult
            {
                Id = Guid.Parse("3f335f85-7378-489d-92cb-fa16462c9813"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("d9dbd808-34ee-46d0-8ad9-c9396a845bf6"),
            },
            new SeamResult
            {
                Id = Guid.Parse("75bfc3fe-87c7-46f0-abca-4d879c71a683"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("27c80ed7-bf6f-4a6a-a1d8-9728a3aecfce"),
            },
            new SeamResult
            {
                Id = Guid.Parse("a5bd107d-97ed-40b2-9b92-e4a87a313fb8"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("f29418ab-5a27-47de-bea9-629e410ab4d1"),
            },
            new SeamResult
            {
                Id = Guid.Parse("95f92ca2-f9f8-4680-84bf-cdb78fc60783"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("da264e77-8bb1-4ca1-aedc-439232d050a6"),
            },
            new SeamResult
            {
                Id = Guid.Parse("af2dfaed-e8fd-4746-b411-27dc640df693"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("15cc8a1f-2440-4bdd-9caf-846b3db51068"),
            },
            new SeamResult
            {
                Id = Guid.Parse("fd33adc2-b52d-406c-aecc-a6614c92be46"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("d9ecbd82-d9f6-41df-8ebd-ee3b36b0afe1"),
            },
            new SeamResult
            {
                Id = Guid.Parse("16e4d71a-c70b-4db6-bce8-c0f1583e5b5a"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("55e90118-e490-4e3c-90cc-38c85926aeb4"),
            },
            new SeamResult
            {
                Id = Guid.Parse("5b9ee8b8-7c90-467a-9fe0-b2147517d989"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("f19ab689-f835-485f-af67-d41efa10f651"),
            },
            new SeamResult
            {
                Id = Guid.Parse("7fd26d80-83c6-4458-a251-9193370ecf33"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("1d660994-f74f-413b-9647-c21e15531079"),
            },
            new SeamResult
            {
                Id = Guid.Parse("9d22e3d3-e394-4196-8031-b20cf50c5d55"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("d9ecbd82-d9f6-41df-8ebd-ee3b36b0afe1"),
            },
            new SeamResult
            {
                Id = Guid.Parse("d5e496b2-1830-4366-b1b9-a360bd55e1f6"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("15cc8a1f-2440-4bdd-9caf-846b3db51068"),
            },
            new SeamResult
            {
                Id = Guid.Parse("f2922fa8-f2e1-4c8b-a306-2e214aa99d66"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("da264e77-8bb1-4ca1-aedc-439232d050a6"),
            },
            new SeamResult
            {
                Id = Guid.Parse("4aff4986-a1b8-4160-be46-93eea3f371e0"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("27c80ed7-bf6f-4a6a-a1d8-9728a3aecfce"),
            },
            new SeamResult
            {
                Id = Guid.Parse("ae7a480b-6087-426e-85ca-84e5a012cab0"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("d9dbd808-34ee-46d0-8ad9-c9396a845bf6"),
            },
            new SeamResult
            {
                Id = Guid.Parse("ced83451-e28f-4cc0-808e-6e44496068ea"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("f29418ab-5a27-47de-bea9-629e410ab4d1"),
            },
            new SeamResult
            {
                Id = Guid.Parse("8170bb85-b9ec-47a7-99b9-d50d597ca2e0"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("3ac363fb-d192-485a-aa60-33b73951193a"),
            },
            new SeamResult
            {
                Id = Guid.Parse("89e1d948-2c4c-4e93-9b23-dd347db5943e"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("eabee1fe-082a-4e6f-afaf-e84918777617"),
            },
            new SeamResult
            {
                Id = Guid.Parse("a4cdc319-e28e-4c3b-9e6d-68bf7c5f1fde"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("74c58713-2bec-4d4c-9887-2f4a6ffbb8dc"),
            },
            new SeamResult
            {
                Id = Guid.Parse("5dbac060-823c-4a7c-a600-52267d0c4234"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("3ac363fb-d192-485a-aa60-33b73951193a"),
            },
            new SeamResult
            {
                Id = Guid.Parse("69d34d2d-037d-4a72-8ded-dfeed13fb518"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("0d7a8abe-5a68-4be0-a99d-63e2223e6d1f"),
            },
            new SeamResult
            {
                Id = Guid.Parse("8250ac0f-6398-493e-9225-e676da5e2964"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("6b1e2b36-2ceb-4460-af6c-fb93186d12d4"),
            },
            new SeamResult
            {
                Id = Guid.Parse("8df0b541-0219-4b2e-8a0d-51cedef5ff7e"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("bd94c72e-730c-42a2-a8c4-b33937d189a7"),
            },
            new SeamResult
            {
                Id = Guid.Parse("9ab3b2b9-1a9c-413a-a09a-bad1957e2d6b"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("74c58713-2bec-4d4c-9887-2f4a6ffbb8dc"),
            },
            new SeamResult
            {
                Id = Guid.Parse("be52d412-c857-4553-b2d8-cce28c0a0688"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("eabee1fe-082a-4e6f-afaf-e84918777617"),
            },
            new SeamResult
            {
                Id = Guid.Parse("af709154-0d5a-465e-b5a0-36ed336e249c"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("43517b65-b3ec-492f-801d-cff9b4a52b93"),
            },
            new SeamResult
            {
                Id = Guid.Parse("c0f204ef-fe93-4b72-8b1d-3a948427d358"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("8fa8094e-1d6a-46e9-a2a0-5145407d2870"),
            },
            new SeamResult
            {
                Id = Guid.Parse("eb87660c-d2e1-4c7a-9d86-eee4d1e76451"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("65578bcb-df3f-4641-ac75-d342cc933107"),
            },
            new SeamResult
            {
                Id = Guid.Parse("1925bbbc-f269-4eda-9251-73b189876ea3"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("8fa8094e-1d6a-46e9-a2a0-5145407d2870"),
            },
            new SeamResult
            {
                Id = Guid.Parse("5619003b-2542-4e33-a1b4-ab66d020982f"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("65578bcb-df3f-4641-ac75-d342cc933107"),
            },
            new SeamResult
            {
                Id = Guid.Parse("aa4bce43-f427-4549-82d0-7981ed75ecc4"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("43517b65-b3ec-492f-801d-cff9b4a52b93"),
            },
            new SeamResult
            {
                Id = Guid.Parse("05745ca3-37ab-43cb-a199-7bd92c0aff0e"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("de386b8e-4b04-4d4a-bf53-20099e645aa9"),
            },
            new SeamResult
            {
                Id = Guid.Parse("09174c77-40fd-467b-83d4-4e8e4f966525"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("cfba41ce-06a4-4877-9f66-d17efc17c1c1"),
            },
            new SeamResult
            {
                Id = Guid.Parse("127d78ad-d00b-4ff5-88fa-78dccb653893"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("51e700f7-d668-4ecc-b991-8fa66a395bba"),
            },
            new SeamResult
            {
                Id = Guid.Parse("232f690b-3951-4ef8-8c25-80f95f49845f"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("79ae86eb-f645-4b4b-9694-818f53de97e8"),
            },
            new SeamResult
            {
                Id = Guid.Parse("0ae41916-a03e-43e0-9148-c0e549d5ea8e"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("cfba41ce-06a4-4877-9f66-d17efc17c1c1"),
            },
            new SeamResult
            {
                Id = Guid.Parse("10548f45-90ec-4e2f-84df-edf2e9dd9ee4"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("3d8e7c24-b67e-4ae6-ba9a-4bf6b3e7b6a3"),
            },
            new SeamResult
            {
                Id = Guid.Parse("638dfd5a-fed9-4a9d-93f4-93af7c92884a"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("ff1d28a6-7900-4218-92d4-dab56392fc1a"),
            },
            new SeamResult
            {
                Id = Guid.Parse("6850f1ba-2024-4842-97b6-1a5226a6ca11"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("54ff147e-247d-44b4-9dff-d854474ccd4a"),
            },
            new SeamResult
            {
                Id = Guid.Parse("6b33978f-9eca-4d45-85fd-1a4cc3a8895a"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("f3824d86-0cc6-417e-9db8-100b736c56bb"),
            },
            new SeamResult
            {
                Id = Guid.Parse("6e097c37-7911-4cca-af6d-985bce66a914"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("e75725ce-9c6d-46cd-ae16-a86d4b822972"),
            },
            new SeamResult
            {
                Id = Guid.Parse("788c133e-0163-491a-9e6e-bda4f38b14ed"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("3d8e7c24-b67e-4ae6-ba9a-4bf6b3e7b6a3"),
            },
            new SeamResult
            {
                Id = Guid.Parse("7e83e722-3ef3-4a7e-a6e6-8d0c0bda9168"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("5f69f15e-3071-4b0e-9db8-9f1ac8df2884"),
            },
            new SeamResult
            {
                Id = Guid.Parse("829a7de1-27c8-4ea0-908e-aed272786c56"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("58e244c2-a55f-4c69-90b6-163adfde277b"),
            },
            new SeamResult
            {
                Id = Guid.Parse("88ae8327-89d4-4804-a645-7be9cbca141b"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("f63125c1-acf5-4aaf-b553-516f331b8e32"),
            },
            new SeamResult
            {
                Id = Guid.Parse("8ac51536-2df4-4121-abae-3ec608b51897"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("dd3982b0-f157-449d-af7f-f5cc9cd829d7"),
            },
            new SeamResult
            {
                Id = Guid.Parse("9d6dc015-61d7-41bd-845b-c6840a8f3e72"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("b82fa137-85b0-49e8-92cb-082495b9d328"),
            },
            new SeamResult
            {
                Id = Guid.Parse("b36309fe-798c-4767-bb60-10c895788974"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("76d0a222-ba01-464d-ac10-d0b0e1443116"),
            },
            new SeamResult
            {
                Id = Guid.Parse("b52ef4c8-9b77-4b06-a75c-f462547eab19"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("0dfe2399-755a-4beb-b686-40214d966dd6"),
            },
            new SeamResult
            {
                Id = Guid.Parse("b64b2be2-dc1b-4384-a91c-df39c4df8d5d"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("0d6ddde9-3469-4c4a-8dc3-74c3e07cb9b6"),
            },
            new SeamResult
            {
                Id = Guid.Parse("dceec20b-7ca1-484b-95dd-6db83563f82b"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("8fba9a40-909c-4268-82a7-1913a1adfc21"),
            },
            new SeamResult
            {
                Id = Guid.Parse("2e51c3a9-a8a7-457e-9f22-ab28317db6da"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("f3824d86-0cc6-417e-9db8-100b736c56bb"),
            },
            new SeamResult
            {
                Id = Guid.Parse("43eeab06-8fe2-450c-9593-c2a3ba487a43"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("ff1d28a6-7900-4218-92d4-dab56392fc1a"),
            },
            new SeamResult
            {
                Id = Guid.Parse("6aeaf2f9-9e1f-43a5-a181-12438889452a"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("58e244c2-a55f-4c69-90b6-163adfde277b"),
            },
            new SeamResult
            {
                Id = Guid.Parse("7514bed3-003b-4374-a541-241b68cf24d7"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("e75725ce-9c6d-46cd-ae16-a86d4b822972"),
            },
            new SeamResult
            {
                Id = Guid.Parse("ef7d7316-e52b-43a0-bdbe-35a404c7ed82"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("5f69f15e-3071-4b0e-9db8-9f1ac8df2884"),
            },
            new SeamResult
            {
                Id = Guid.Parse("ffd7972f-a583-4b04-8c5b-cad36a810e4f"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("b82fa137-85b0-49e8-92cb-082495b9d328"),
            },
            new SeamResult
            {
                Id = Guid.Parse("0a807acd-dbc3-4f06-a738-12e519c11e2c"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("f3824d86-0cc6-417e-9db8-100b736c56bb"),
            },
            new SeamResult
            {
                Id = Guid.Parse("5c0a545f-04ff-4bbb-8806-267abbd9694e"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("58e244c2-a55f-4c69-90b6-163adfde277b"),
            },
            new SeamResult
            {
                Id = Guid.Parse("8bacbe04-855d-44e5-a8f6-3a7e936d4bdf"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("ff1d28a6-7900-4218-92d4-dab56392fc1a"),
            },
            new SeamResult
            {
                Id = Guid.Parse("b9170d4a-ebd9-4e15-8a0f-bc150eb3b548"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("e75725ce-9c6d-46cd-ae16-a86d4b822972"),
            },
            new SeamResult
            {
                Id = Guid.Parse("eb89dfa7-ae68-4233-8fce-c9348103262e"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("5f69f15e-3071-4b0e-9db8-9f1ac8df2884"),
            },
            new SeamResult
            {
                Id = Guid.Parse("f17005c9-fa4c-4b0b-8039-6e5577576ac8"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("b82fa137-85b0-49e8-92cb-082495b9d328"),
            },
            new SeamResult
            {
                Id = Guid.Parse("11ce1378-ebbb-4752-b034-5d7cdec9535e"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("51e700f7-d668-4ecc-b991-8fa66a395bba"),
            },
            new SeamResult
            {
                Id = Guid.Parse("29f03a7f-76ae-4dfb-87fd-3257be80bd1c"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("f63125c1-acf5-4aaf-b553-516f331b8e32"),
            },
            new SeamResult
            {
                Id = Guid.Parse("7bb4d993-4930-432c-95f4-9dc2133288ba"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("f63125c1-acf5-4aaf-b553-516f331b8e32"),
            },
            new SeamResult
            {
                Id = Guid.Parse("c8613913-7df3-4205-b279-c2b7f0ad86ec"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("51e700f7-d668-4ecc-b991-8fa66a395bba"),
            },
            new SeamResult
            {
                Id = Guid.Parse("e39f8df1-c232-481d-9e9a-dc9fe25e1684"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("cfba41ce-06a4-4877-9f66-d17efc17c1c1"),
            },
            new SeamResult
            {
                Id = Guid.Parse("3580e38d-08d8-4948-b9a2-08cfa1b29318"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("de386b8e-4b04-4d4a-bf53-20099e645aa9"),
            },
            new SeamResult
            {
                Id = Guid.Parse("a07ca01f-b4eb-428b-825d-73e653c9b994"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("dd3982b0-f157-449d-af7f-f5cc9cd829d7"),
            },
            new SeamResult
            {
                Id = Guid.Parse("511659cf-e873-46cd-9979-8f9d0ce749f8"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("3d8e7c24-b67e-4ae6-ba9a-4bf6b3e7b6a3"),
            },
            new SeamResult
            {
                Id = Guid.Parse("80e9c9d9-7f33-4078-b51c-67738ca21979"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("dd3982b0-f157-449d-af7f-f5cc9cd829d7"),
            },
            new SeamResult
            {
                Id = Guid.Parse("dcf7d516-499f-4408-9278-404cbee5804d"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("de386b8e-4b04-4d4a-bf53-20099e645aa9"),
            },
            new SeamResult
            {
                Id = Guid.Parse("33f3f8cb-22c9-4f2d-ab97-adb8b6adac26"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("0dfe2399-755a-4beb-b686-40214d966dd6"),
            },
            new SeamResult
            {
                Id = Guid.Parse("4a4a9510-5922-4496-a60b-a5687f8e0c61"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("76d0a222-ba01-464d-ac10-d0b0e1443116"),
            },
            new SeamResult
            {
                Id = Guid.Parse("5e28f7de-9252-496e-a01c-3ad1c3430a32"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("0d6ddde9-3469-4c4a-8dc3-74c3e07cb9b6"),
            },
            new SeamResult
            {
                Id = Guid.Parse("732db908-79d5-4c23-9bd9-adefb9b6ba28"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("8fba9a40-909c-4268-82a7-1913a1adfc21"),
            },
            new SeamResult
            {
                Id = Guid.Parse("8441341d-89b5-4baa-bd8a-8c8a0d83c099"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("79ae86eb-f645-4b4b-9694-818f53de97e8"),
            },
            new SeamResult
            {
                Id = Guid.Parse("abf2e501-9968-4cef-a5f0-675b8a804140"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("54ff147e-247d-44b4-9dff-d854474ccd4a"),
            },
            new SeamResult
            {
                Id = Guid.Parse("36720f35-0171-40a1-b512-4a6006e86cce"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("0dfe2399-755a-4beb-b686-40214d966dd6"),
            },
            new SeamResult
            {
                Id = Guid.Parse("8c64b2cc-48cf-4b5e-96ba-3b58f9877095"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("0d6ddde9-3469-4c4a-8dc3-74c3e07cb9b6"),
            },
            new SeamResult
            {
                Id = Guid.Parse("c085bb22-ee69-42ff-9220-dee993087e25"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("76d0a222-ba01-464d-ac10-d0b0e1443116"),
            },
            new SeamResult
            {
                Id = Guid.Parse("dc9d6428-c42f-4d9c-8047-c515381680c9"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("54ff147e-247d-44b4-9dff-d854474ccd4a"),
            },
            new SeamResult
            {
                Id = Guid.Parse("df58c40a-81d7-43b6-a5bc-fc4bd0c31fc7"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("8fba9a40-909c-4268-82a7-1913a1adfc21"),
            },
            new SeamResult
            {
                Id = Guid.Parse("e0b9c677-cbdd-4505-83ab-f5c27b519353"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("79ae86eb-f645-4b4b-9694-818f53de97e8"),
            },
            new SeamResult
            {
                Id = Guid.Parse("04dc0281-c1f3-4310-a8be-4f8b1e597926"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("76469742-0e97-4389-841b-abb858f149d5"),
            },
            new SeamResult
            {
                Id = Guid.Parse("07642f5a-9b3b-4fa8-9919-b86dc09fbc7f"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("71bf9c1d-5d26-41ef-9b92-33a9132c7b58"),
            },
            new SeamResult
            {
                Id = Guid.Parse("67ad03f6-eb2d-44bf-b01b-7564f643d8e7"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("151ba506-323c-492f-8bc7-792c1a3a3261"),
            },
            new SeamResult
            {
                Id = Guid.Parse("6ed63a6e-73c8-4d2a-99a7-8def1924dac7"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("6549760a-d9fb-4ea6-9efe-761552343255"),
            },
            new SeamResult
            {
                Id = Guid.Parse("7760753a-2d0c-4997-90e7-9b88a49c0555"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("ece10748-bd4d-4a24-8cd1-c3fe8e9679ed"),
            },
            new SeamResult
            {
                Id = Guid.Parse("79088ec6-2989-4f76-b787-53d617d21084"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("48f3abc9-fa36-48a7-a97c-6f6ddf6ed689"),
            },
            new SeamResult
            {
                Id = Guid.Parse("7f0ad954-ba53-44ff-87e6-4959b1c1ef5c"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("86edd6d6-5fd3-40a9-81f1-dbfe1b36aa50"),
            },
            new SeamResult
            {
                Id = Guid.Parse("8668e708-8d99-461d-8fc4-04342c1a73b8"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("3e7c2f83-0fd0-4d2c-aa9e-442a68e924a0"),
            },
            new SeamResult
            {
                Id = Guid.Parse("a4c3aab3-7552-4b07-82d9-9f1d30ac4055"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("2ac04518-7a7e-4e36-b680-ee817d1eaa86"),
            },
            new SeamResult
            {
                Id = Guid.Parse("a5ba0fdb-d01b-47c7-8b93-a8f1b8294796"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("91edd7a5-5447-4040-adc4-127a6b553075"),
            },
            new SeamResult
            {
                Id = Guid.Parse("ba12d536-f2f3-4e4a-a8bb-49b222feeea5"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("14143820-3069-4af7-ac0e-9d718da05df6"),
            },
            new SeamResult
            {
                Id = Guid.Parse("bace0cd7-3b5b-4e3d-a062-2bfd098fe504"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("cb53464b-8c29-428c-9dbc-069124b2116a"),
            },
            new SeamResult
            {
                Id = Guid.Parse("bfa2309e-2374-4aab-91d8-072c48efc4d4"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("21009ef9-6b0e-418a-8254-0df8c40fdd26"),
            },
            new SeamResult
            {
                Id = Guid.Parse("0deb5ada-5de1-4335-8a34-b04ff522019c"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("91edd7a5-5447-4040-adc4-127a6b553075"),
            },
            new SeamResult
            {
                Id = Guid.Parse("9147102d-00a2-4734-b5a4-c54f6c02eac2"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("68a29e4c-20aa-40da-8b43-be876fad5cc5"),
            },
            new SeamResult
            {
                Id = Guid.Parse("9a7f9049-2e70-4390-996e-034402c36c07"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("76469742-0e97-4389-841b-abb858f149d5"),
            },
            new SeamResult
            {
                Id = Guid.Parse("a551980d-efe2-4c4a-b8f9-7472e1676567"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("cb53464b-8c29-428c-9dbc-069124b2116a"),
            },
            new SeamResult
            {
                Id = Guid.Parse("1d074901-9528-432d-85b2-5ec9d7bb1d6f"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("151ba506-323c-492f-8bc7-792c1a3a3261"),
            },
            new SeamResult
            {
                Id = Guid.Parse("3d6c57b3-af77-4577-bf71-2c8a17c464c5"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("68a29e4c-20aa-40da-8b43-be876fad5cc5"),
            },
            new SeamResult
            {
                Id = Guid.Parse("5ea5ad9a-a61f-433f-aa1d-49d8af9dd9ba"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("91edd7a5-5447-4040-adc4-127a6b553075"),
            },
            new SeamResult
            {
                Id = Guid.Parse("6b3040e9-5a14-49a0-934a-e87aa3ee7131"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("76469742-0e97-4389-841b-abb858f149d5"),
            },
            new SeamResult
            {
                Id = Guid.Parse("7aa9cffb-eb81-4c52-a2ef-f20598f879b2"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("3e7c2f83-0fd0-4d2c-aa9e-442a68e924a0"),
            },
            new SeamResult
            {
                Id = Guid.Parse("0f825b5c-e3bb-4324-9d46-059442d1cf32"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("14143820-3069-4af7-ac0e-9d718da05df6"),
            },
            new SeamResult
            {
                Id = Guid.Parse("17dbcb4e-2078-4e78-a9f8-29338deb3182"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("ece10748-bd4d-4a24-8cd1-c3fe8e9679ed"),
            },
            new SeamResult
            {
                Id = Guid.Parse("5677935a-d124-4056-8043-8df943529c1b"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("af93c5e6-f8c3-44b1-acbd-119d1b90bc65"),
            },
            new SeamResult
            {
                Id = Guid.Parse("9de5f45b-8145-47c4-b95d-6043b2eaa927"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("ece10748-bd4d-4a24-8cd1-c3fe8e9679ed"),
            },
            new SeamResult
            {
                Id = Guid.Parse("aacc1040-4bb0-42bc-b604-e681c8feb9d7"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("af93c5e6-f8c3-44b1-acbd-119d1b90bc65"),
            },
            new SeamResult
            {
                Id = Guid.Parse("979564f5-3643-4d46-bda9-80fae7569413"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("6549760a-d9fb-4ea6-9efe-761552343255"),
            },
            new SeamResult
            {
                Id = Guid.Parse("2a2b13d0-442b-4fc9-ad83-bff931d73cfc"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("e1d7a081-fb5f-4a31-bc67-708375c6bf7f"),
            },
            new SeamResult
            {
                Id = Guid.Parse("12177a0d-be91-4d4b-b6b5-145398bb91f6"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("48f3abc9-fa36-48a7-a97c-6f6ddf6ed689"),
            },
            new SeamResult
            {
                Id = Guid.Parse("adf76d0e-54a3-48c5-9e19-7fc48531f74f"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("6549760a-d9fb-4ea6-9efe-761552343255"),
            },
            new SeamResult
            {
                Id = Guid.Parse("1339d662-eaba-48e7-882d-9bba0ce3086d"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("48f3abc9-fa36-48a7-a97c-6f6ddf6ed689"),
            },
            new SeamResult
            {
                Id = Guid.Parse("350a3c13-bb71-4abd-95ae-664dcd51c350"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("71bf9c1d-5d26-41ef-9b92-33a9132c7b58"),
            },
            new SeamResult
            {
                Id = Guid.Parse("4cd42a76-e62c-4945-8712-9648fc59d60d"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("2ac04518-7a7e-4e36-b680-ee817d1eaa86"),
            },
            new SeamResult
            {
                Id = Guid.Parse("6306a9a5-0263-49aa-ad6e-4bb074d43ab6"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("1bfa9837-467e-442d-98bd-9222db9152f9"),
            },
            new SeamResult
            {
                Id = Guid.Parse("7d43650d-bc42-4fe9-a4f4-2bdec3070d00"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("86edd6d6-5fd3-40a9-81f1-dbfe1b36aa50"),
            },
            new SeamResult
            {
                Id = Guid.Parse("2f1df606-d1fe-4fae-9b8c-49569c523b29"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("86edd6d6-5fd3-40a9-81f1-dbfe1b36aa50"),
            },
            new SeamResult
            {
                Id = Guid.Parse("361c4106-3e6e-4924-9c9a-5188668920e6"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("2ac04518-7a7e-4e36-b680-ee817d1eaa86"),
            },
            new SeamResult
            {
                Id = Guid.Parse("734a3b77-2796-4db3-ad96-b0825aa9c5dc"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("71bf9c1d-5d26-41ef-9b92-33a9132c7b58"),
            },
            new SeamResult
            {
                Id = Guid.Parse("7b832513-44b1-462e-a83c-41fa1f990597"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("91f6396d-95ab-44be-8889-c6c145f94bf5"),
            },
            new SeamResult
            {
                Id = Guid.Parse("85c38dec-2e31-49b5-ad39-5c2b7af25848"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("e1d7a081-fb5f-4a31-bc67-708375c6bf7f"),
            },
            new SeamResult
            {
                Id = Guid.Parse("aeab9c09-2d6d-4751-8d73-b1366b81cd84"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("1bfa9837-467e-442d-98bd-9222db9152f9"),
            },
            new SeamResult
            {
                Id = Guid.Parse("c49a88dd-273e-4100-9e8c-abfa02f8d8f5"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("68a29e4c-20aa-40da-8b43-be876fad5cc5"),
            },
            new SeamResult
            {
                Id = Guid.Parse("d0ed904b-e358-43d9-aba2-5c1a738eae2b"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("1bfa9837-467e-442d-98bd-9222db9152f9"),
            },
            new SeamResult
            {
                Id = Guid.Parse("e904a1f8-1d49-486f-8ec5-e78d75bfe7ca"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("af93c5e6-f8c3-44b1-acbd-119d1b90bc65"),
            },
            new SeamResult
            {
                Id = Guid.Parse("e9842ead-58fc-4481-954a-30a47416bcff"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("e1d7a081-fb5f-4a31-bc67-708375c6bf7f"),
            },
            new SeamResult
            {
                Id = Guid.Parse("f39c1dd1-88da-478c-9efe-f21ea3806a29"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("91f6396d-95ab-44be-8889-c6c145f94bf5"),
            },
            new SeamResult
            {
                Id = Guid.Parse("e0c65762-6bc3-455e-8a74-ed0020c0b7b3"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("3e7c2f83-0fd0-4d2c-aa9e-442a68e924a0"),
            },
            new SeamResult
            {
                Id = Guid.Parse("e28abdae-4d94-49a4-96a8-f0d6071b2371"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("151ba506-323c-492f-8bc7-792c1a3a3261"),
            },
            new SeamResult
            {
                Id = Guid.Parse("f92cfa9a-49f4-4a47-a44d-252bf827617d"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("cb53464b-8c29-428c-9dbc-069124b2116a"),
            },
            new SeamResult
            {
                Id = Guid.Parse("eb4e66de-00bd-4e5b-89f9-3dcbb5952d8a"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("14143820-3069-4af7-ac0e-9d718da05df6"),
            },
            new SeamResult
            {
                Id = Guid.Parse("1e629274-6486-40dc-9d76-fc527117983d"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("b76c4260-0d58-4376-b624-1a8a0bf017aa"),
            },
            new SeamResult
            {
                Id = Guid.Parse("3ec670e8-3080-41e6-82f2-a48bbb342377"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("2a003b51-f5ea-4647-826d-c4874ffd0376"),
            },
            new SeamResult
            {
                Id = Guid.Parse("0d14e490-cd44-4a4c-bfcf-39ef8848f4e4"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("e9b5c1b8-a581-4d79-bca7-42f54efa2714"),
            },
            new SeamResult
            {
                Id = Guid.Parse("dc808084-6ac5-4403-8605-140cf7e77bbd"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("21009ef9-6b0e-418a-8254-0df8c40fdd26"),
            },
            new SeamResult
            {
                Id = Guid.Parse("f6be3eab-be2a-4553-8128-18d5a0ecb56d"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("21009ef9-6b0e-418a-8254-0df8c40fdd26"),
            },
            new SeamResult
            {
                Id = Guid.Parse("f81d2610-bc68-42f9-9798-2c602de51e09"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("91f6396d-95ab-44be-8889-c6c145f94bf5"),
            },
            new SeamResult
            {
                Id = Guid.Parse("0328476f-b1b1-4562-b72a-41aac0c640f8"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("68511386-69a6-4feb-ab7d-279c52044b9c"),
            },
            new SeamResult
            {
                Id = Guid.Parse("0603c4e4-9a2b-47fb-ae53-ebb18ffd8ab6"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("a3ec12f4-0cb9-4fab-9dba-ddeb90011ae6"),
            },
            new SeamResult
            {
                Id = Guid.Parse("0bc03d69-57df-4e12-99f1-cc82c5338c0f"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("68511386-69a6-4feb-ab7d-279c52044b9c"),
            },
            new SeamResult
            {
                Id = Guid.Parse("1164b7c5-f467-4024-8089-635b1b033984"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("bf9c2b23-4540-4fc4-8e3b-61c18bfdecae"),
            },
            new SeamResult
            {
                Id = Guid.Parse("14e556a0-80b9-46d9-b4f0-01b525d83f65"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("5773e326-ab06-44c7-bc38-3763fecdabbe"),
            },
            new SeamResult
            {
                Id = Guid.Parse("242b388e-be81-4334-a847-cbc928183c6b"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("53068f11-34a0-446d-b964-89e524add8e9"),
            },
            new SeamResult
            {
                Id = Guid.Parse("28e264d0-74e7-404e-92e2-6db7cc66f988"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("680dda85-9fba-4977-851d-245d2820fcdd"),
            },
            new SeamResult
            {
                Id = Guid.Parse("2ff97f79-c5ec-49b7-834b-4352783eb12e"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("a3ec12f4-0cb9-4fab-9dba-ddeb90011ae6"),
            },
            new SeamResult
            {
                Id = Guid.Parse("30513c46-0656-46c6-9585-f78025191882"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("5773e326-ab06-44c7-bc38-3763fecdabbe"),
            },
            new SeamResult
            {
                Id = Guid.Parse("31ee5f03-4c90-430f-a580-cc745efc34b1"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("680dda85-9fba-4977-851d-245d2820fcdd"),
            },
            new SeamResult
            {
                Id = Guid.Parse("3393e9bf-96f9-4036-a376-06f06605b4e3"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("f2c7a58a-a9f6-4489-94a5-7549ce07efdd"),
            },
            new SeamResult
            {
                Id = Guid.Parse("367cbf68-9606-4b05-ad8e-fb4e9884bacd"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("051a19c3-5628-4d43-b39a-4ad717946f5a"),
            },
            new SeamResult
            {
                Id = Guid.Parse("3a808d02-3879-4e15-9294-1fc470756465"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("abbe7f4d-d427-4428-91b3-3cff32760fec"),
            },
            new SeamResult
            {
                Id = Guid.Parse("40c840ad-9a1c-4040-97ad-525d020b6f80"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("5773e326-ab06-44c7-bc38-3763fecdabbe"),
            },
            new SeamResult
            {
                Id = Guid.Parse("453ce62a-e6bd-40b0-b060-e54c5dff2f85"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("bf9c2b23-4540-4fc4-8e3b-61c18bfdecae"),
            },
            new SeamResult
            {
                Id = Guid.Parse("51354470-e905-408d-901a-6326fa2ea533"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("815ea51d-c562-4deb-a3e6-c41b8973e16c"),
            },
            new SeamResult
            {
                Id = Guid.Parse("5d43a233-c0a7-47c6-8c37-a34387c46917"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("2dc99950-6c7c-4ab0-9e02-f17a6fd935e6"),
            },
            new SeamResult
            {
                Id = Guid.Parse("63997135-324b-4727-811a-dcc13e56de20"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("fb19a111-0bdf-474f-8d1d-8dcc3c7fc078"),
            },
            new SeamResult
            {
                Id = Guid.Parse("81299df2-55d5-40ec-8cbe-702008b9fa71"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("6ca44b0b-ea70-470f-a1d3-c167af181f0f"),
            },
            new SeamResult
            {
                Id = Guid.Parse("902ff03d-6f4f-4f28-8cac-5b9253e3eaad"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("ef2c7559-5207-422b-b597-9512072b5321"),
            },
            new SeamResult
            {
                Id = Guid.Parse("97a3b3a3-75b4-467c-97af-acea8b628528"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("79136e84-eb07-4594-b806-38f627cf295c"),
            },
            new SeamResult
            {
                Id = Guid.Parse("995e820f-22a3-4e1d-92f5-cdcfd9f5820d"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("68511386-69a6-4feb-ab7d-279c52044b9c"),
            },
            new SeamResult
            {
                Id = Guid.Parse("a477c6d9-f059-4ab6-aa28-71d9e31ef111"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("ef2c7559-5207-422b-b597-9512072b5321"),
            },
            new SeamResult
            {
                Id = Guid.Parse("ac669c94-7d3f-42bb-8902-85380f53e97b"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("a3ec12f4-0cb9-4fab-9dba-ddeb90011ae6"),
            },
            new SeamResult
            {
                Id = Guid.Parse("b25940cd-7b3b-4d4e-8800-6ee9c1542116"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("abbe7f4d-d427-4428-91b3-3cff32760fec"),
            },
            new SeamResult
            {
                Id = Guid.Parse("b3aa389b-c4db-4ae4-b59b-99b57741ff0e"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("abbe7f4d-d427-4428-91b3-3cff32760fec"),
            },
            new SeamResult
            {
                Id = Guid.Parse("b8d88324-3a9a-4ed2-b335-8d585b808de9"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("680dda85-9fba-4977-851d-245d2820fcdd"),
            },
            new SeamResult
            {
                Id = Guid.Parse("bd097c4d-1aa7-4e28-b5f5-48d7c7c82af6"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("53068f11-34a0-446d-b964-89e524add8e9"),
            },
            new SeamResult
            {
                Id = Guid.Parse("c3e943e9-d690-4fc9-bb00-e4c3516e4adb"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("ef2c7559-5207-422b-b597-9512072b5321"),
            },
            new SeamResult
            {
                Id = Guid.Parse("c6b73c98-fff3-4d96-a89b-7b51b0a9c77c"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("bf9c2b23-4540-4fc4-8e3b-61c18bfdecae"),
            },
            new SeamResult
            {
                Id = Guid.Parse("c92d6279-a231-40e1-a209-ee57e57bac11"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("f2c7a58a-a9f6-4489-94a5-7549ce07efdd"),
            },
            new SeamResult
            {
                Id = Guid.Parse("db6c1f08-3c7a-448e-9196-4f740c359faf"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("aa96fe2f-d9e8-4e3e-bef3-6744554d45ad"),
            },
            new SeamResult
            {
                Id = Guid.Parse("e0edc939-fe43-4d79-ae81-fd927cc4e23e"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("53068f11-34a0-446d-b964-89e524add8e9"),
            },
            new SeamResult
            {
                Id = Guid.Parse("e632fd64-52a1-4e59-800e-34981154711f"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("a57e6340-096c-4afa-a362-568ec2782600"),
            },
            new SeamResult
            {
                Id = Guid.Parse("f8d2fe01-c939-4e6a-8c90-48a4f4fc3fe9"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("8496be09-574c-4735-a0c4-69a0466c3a03"),
            },
            new SeamResult
            {
                Id = Guid.Parse("fef10cf8-83d7-460f-8faa-26b3a207b96f"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("f2c7a58a-a9f6-4489-94a5-7549ce07efdd"),
            },
            new SeamResult
            {
                Id = Guid.Parse("16b02cab-e543-4399-a630-48e218cf70c3"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("8496be09-574c-4735-a0c4-69a0466c3a03"),
            },
            new SeamResult
            {
                Id = Guid.Parse("2f57ab82-cdde-443e-8d7d-806882d8cb0f"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("fb19a111-0bdf-474f-8d1d-8dcc3c7fc078"),
            },
            new SeamResult
            {
                Id = Guid.Parse("34b6652b-8da8-419b-8493-5705064987d4"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("a57e6340-096c-4afa-a362-568ec2782600"),
            },
            new SeamResult
            {
                Id = Guid.Parse("5a39aa51-d9ed-434e-98a4-ad09223533d6"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("815ea51d-c562-4deb-a3e6-c41b8973e16c"),
            },
            new SeamResult
            {
                Id = Guid.Parse("e3002106-eabb-4466-877f-72c270be7e5f"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("2dc99950-6c7c-4ab0-9e02-f17a6fd935e6"),
            },
            new SeamResult
            {
                Id = Guid.Parse("f2836971-5757-4d6f-aa17-a13c19d92433"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("051a19c3-5628-4d43-b39a-4ad717946f5a"),
            },
            new SeamResult
            {
                Id = Guid.Parse("13a45e22-24e5-4487-8ac1-867e0ceae771"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("2dc99950-6c7c-4ab0-9e02-f17a6fd935e6"),
            },
            new SeamResult
            {
                Id = Guid.Parse("31e20825-b475-4900-9005-4909800f7670"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("fb19a111-0bdf-474f-8d1d-8dcc3c7fc078"),
            },
            new SeamResult
            {
                Id = Guid.Parse("5015ce96-0511-4b7e-b44e-0acfa1e7f0f4"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("a57e6340-096c-4afa-a362-568ec2782600"),
            },
            new SeamResult
            {
                Id = Guid.Parse("6d4e9cdb-9445-4851-a61f-aeba035d29e8"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("815ea51d-c562-4deb-a3e6-c41b8973e16c"),
            },
            new SeamResult
            {
                Id = Guid.Parse("b31d439d-fd93-43db-a443-975b5aae671a"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("051a19c3-5628-4d43-b39a-4ad717946f5a"),
            },
            new SeamResult
            {
                Id = Guid.Parse("e525642c-a070-49ab-a9a1-263c77a29d1a"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("8496be09-574c-4735-a0c4-69a0466c3a03"),
            },
            new SeamResult
            {
                Id = Guid.Parse("1e921253-6ebe-488c-ac12-86cfdd9b97f7"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("6ca44b0b-ea70-470f-a1d3-c167af181f0f"),
            },
            new SeamResult
            {
                Id = Guid.Parse("bb67680d-7ed3-4dcd-96bd-c180a04e1591"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("79136e84-eb07-4594-b806-38f627cf295c"),
            },
            new SeamResult
            {
                Id = Guid.Parse("c46a57f8-2a4d-474f-8357-21fa457cf129"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("aa96fe2f-d9e8-4e3e-bef3-6744554d45ad"),
            },
            new SeamResult
            {
                Id = Guid.Parse("6627f473-4394-4a7b-a7e8-db77e4a4511c"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("79136e84-eb07-4594-b806-38f627cf295c"),
            },
            new SeamResult
            {
                Id = Guid.Parse("839fbfb1-87ad-4a8e-9f53-18accceaea05"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("6ca44b0b-ea70-470f-a1d3-c167af181f0f"),
            },
            new SeamResult
            {
                Id = Guid.Parse("88bf2882-ded8-4b7f-a3b4-deb9076bee9e"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("aa96fe2f-d9e8-4e3e-bef3-6744554d45ad"),
            },
            new SeamResult
            {
                Id = Guid.Parse("03d7ca2a-5f54-4392-a51b-9042f7af4899"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("ee7b9c7f-1df5-45d4-ae67-cf9e5d0a6ce5"),
            },
            new SeamResult
            {
                Id = Guid.Parse("04b1d572-f793-4ec4-84ee-662fecadb4fd"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("4f47479e-4b0c-406c-b76d-a5d149d53083"),
            },
            new SeamResult
            {
                Id = Guid.Parse("071bb71c-05b3-4e54-b5f6-d5e95fa5859b"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("674b652d-2065-48b7-bf89-aacc430ea1db"),
            },
            new SeamResult
            {
                Id = Guid.Parse("0a658e74-0b47-4972-b1be-decb00bdd815"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("4f47479e-4b0c-406c-b76d-a5d149d53083"),
            },
            new SeamResult
            {
                Id = Guid.Parse("0bcc1dab-f2c5-4a96-8c8e-4f9a2e509bc9"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("674b652d-2065-48b7-bf89-aacc430ea1db"),
            },
            new SeamResult
            {
                Id = Guid.Parse("14fb26fc-3e97-49db-85d6-f30942e2dd4f"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("fcbb9b82-b30c-4ff4-8f81-c5e42f84b6a9"),
            },
            new SeamResult
            {
                Id = Guid.Parse("15b65c3e-14ce-4f64-b58a-2560a93a108c"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("70e49a41-7c35-496d-b60b-291450133659"),
            },
            new SeamResult
            {
                Id = Guid.Parse("1e10c12d-0e3a-48d4-9d38-046676121236"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("29c11d8b-d2be-42a0-a4cd-238fd3ccc604"),
            },
            new SeamResult
            {
                Id = Guid.Parse("203f58bc-3f9e-4624-b10e-d58a22e7d169"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("46d533fa-acc5-4ec7-ab36-7afee024020b"),
            },
            new SeamResult
            {
                Id = Guid.Parse("20a4c5f2-14a1-4d92-99f2-771e71c359cf"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("674b652d-2065-48b7-bf89-aacc430ea1db"),
            },
            new SeamResult
            {
                Id = Guid.Parse("21bd3a69-8369-4954-a706-9bad94305299"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("e4f94509-e1e9-43d3-9cc2-f2be46eaee26"),
            },
            new SeamResult
            {
                Id = Guid.Parse("2b57e931-b149-40b1-8af5-5949927d47ff"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("55743587-e5d6-49b4-9384-6466d6b19f80"),
            },
            new SeamResult
            {
                Id = Guid.Parse("2e1753b4-1c5b-4c57-ae0f-bf439fa0b57e"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("a8058edc-ada6-411d-8cf5-a5888f033de4"),
            },
            new SeamResult
            {
                Id = Guid.Parse("36e8f2b2-fd41-4b0a-8810-07b2f18a855f"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("a8058edc-ada6-411d-8cf5-a5888f033de4"),
            },
            new SeamResult
            {
                Id = Guid.Parse("38f8ef0e-5035-4033-9a55-66d3edc2d8ae"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("ee7b9c7f-1df5-45d4-ae67-cf9e5d0a6ce5"),
            },
            new SeamResult
            {
                Id = Guid.Parse("40bb1a74-4728-4b36-b134-2dc928b8a544"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("4db44c6a-636a-49be-9669-e8d244263829"),
            },
            new SeamResult
            {
                Id = Guid.Parse("44c7a674-a2cb-471c-a7c1-4dac429ebbae"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("55743587-e5d6-49b4-9384-6466d6b19f80"),
            },
            new SeamResult
            {
                Id = Guid.Parse("51440785-213d-4377-95f7-66b8391654ca"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("853fd777-78b5-49ef-baee-12025f00b4c3"),
            },
            new SeamResult
            {
                Id = Guid.Parse("51ee61a5-780e-4c0d-93da-9550e7a4ce80"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("2a003b51-f5ea-4647-826d-c4874ffd0376"),
            },
            new SeamResult
            {
                Id = Guid.Parse("5f67c1bf-8875-4627-bb6b-786906df9b0c"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("4f47479e-4b0c-406c-b76d-a5d149d53083"),
            },
            new SeamResult
            {
                Id = Guid.Parse("27c37dbe-1650-4e25-a9a3-a83c81b790cd"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("2a003b51-f5ea-4647-826d-c4874ffd0376"),
            },
            new SeamResult
            {
                Id = Guid.Parse("1db54a5f-a475-4949-a941-ac21a6f14523"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("9d5ad775-da4f-4f31-b637-fee1e6a7052c"),
            },
            new SeamResult
            {
                Id = Guid.Parse("53311bcb-1458-4e3f-a7d9-160de8ee6704"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("4db44c6a-636a-49be-9669-e8d244263829"),
            },
            new SeamResult
            {
                Id = Guid.Parse("63a0aa5d-ac52-439a-b713-cbc1d87ab026"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("55743587-e5d6-49b4-9384-6466d6b19f80"),
            },
            new SeamResult
            {
                Id = Guid.Parse("89e3b9f7-a2bb-45b4-9b1f-12c11f5b4983"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("e9b5c1b8-a581-4d79-bca7-42f54efa2714"),
            },
            new SeamResult
            {
                Id = Guid.Parse("8d1eb30b-bc00-4970-8795-a097144032e1"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("edee3016-a2ae-4356-a6d5-d0d60cb2674d"),
            },
            new SeamResult
            {
                Id = Guid.Parse("932c8b5b-fa84-483e-80ff-bbf97e010bbb"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("70e49a41-7c35-496d-b60b-291450133659"),
            },
            new SeamResult
            {
                Id = Guid.Parse("96063e53-c8f8-4708-b613-4222bce0d68a"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("29c11d8b-d2be-42a0-a4cd-238fd3ccc604"),
            },
            new SeamResult
            {
                Id = Guid.Parse("9b144a6d-a385-46ac-83f1-4200d0864080"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("70e49a41-7c35-496d-b60b-291450133659"),
            },
            new SeamResult
            {
                Id = Guid.Parse("9e497a6e-6dc8-47c5-acfb-6ae4cfdde7a0"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("e4f94509-e1e9-43d3-9cc2-f2be46eaee26"),
            },
            new SeamResult
            {
                Id = Guid.Parse("a9a20ed1-daad-42a2-b669-f6a3d4e0730a"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("29c11d8b-d2be-42a0-a4cd-238fd3ccc604"),
            },
            new SeamResult
            {
                Id = Guid.Parse("ae7f0185-8f17-4986-b767-5dbce5440007"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("a8058edc-ada6-411d-8cf5-a5888f033de4"),
            },
            new SeamResult
            {
                Id = Guid.Parse("aec03bc2-b1c9-4f5a-98e8-146efb0dc42f"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("f357d00e-f14d-4b9c-8f5c-e0e8235e2648"),
            },
            new SeamResult
            {
                Id = Guid.Parse("bc79dd00-946c-4d7b-9a22-ba5345c83ad7"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("b76c4260-0d58-4376-b624-1a8a0bf017aa"),
            },
            new SeamResult
            {
                Id = Guid.Parse("d718fa8d-7a39-488f-a774-db2520525ec3"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("ee7b9c7f-1df5-45d4-ae67-cf9e5d0a6ce5"),
            },
            new SeamResult
            {
                Id = Guid.Parse("d7a7a1f4-3ea5-4be6-a8c9-632f7a91145a"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("9d5ad775-da4f-4f31-b637-fee1e6a7052c"),
            },
            new SeamResult
            {
                Id = Guid.Parse("e21422bc-3f33-4a51-a711-7f13e0319374"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("edee3016-a2ae-4356-a6d5-d0d60cb2674d"),
            },
            new SeamResult
            {
                Id = Guid.Parse("eb07c1c4-ca8c-49b9-b538-72cdd74b5ca9"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("edee3016-a2ae-4356-a6d5-d0d60cb2674d"),
            },
            new SeamResult
            {
                Id = Guid.Parse("fd7fec7f-43f3-4788-b1eb-37f07b1f727f"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("e4f94509-e1e9-43d3-9cc2-f2be46eaee26"),
            },
            new SeamResult
            {
                Id = Guid.Parse("72be6c45-10b7-4101-b193-a4790d8c9191"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("f357d00e-f14d-4b9c-8f5c-e0e8235e2648"),
            },
            new SeamResult
            {
                Id = Guid.Parse("877afd2f-22a3-405f-822a-60a49cabfcbb"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("853fd777-78b5-49ef-baee-12025f00b4c3"),
            },
            new SeamResult
            {
                Id = Guid.Parse("cf1dff2a-a26c-4c41-82c4-e6ccbdc3a8f9"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("e9b5c1b8-a581-4d79-bca7-42f54efa2714"),
            },
            new SeamResult
            {
                Id = Guid.Parse("e33bb7bb-ab8a-40da-b730-51b041852a95"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("46d533fa-acc5-4ec7-ab36-7afee024020b"),
            },
            new SeamResult
            {
                Id = Guid.Parse("81ace267-20a9-45ec-8be5-0b2d3c5c8b38"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("853fd777-78b5-49ef-baee-12025f00b4c3"),
            },
            new SeamResult
            {
                Id = Guid.Parse("d95ba445-ca70-4b0b-840b-545dbc16298c"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("46d533fa-acc5-4ec7-ab36-7afee024020b"),
            },
            new SeamResult
            {
                Id = Guid.Parse("f551edea-ebb0-4d59-8598-552e4143ac9a"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("b76c4260-0d58-4376-b624-1a8a0bf017aa"),
            },
            new SeamResult
            {
                Id = Guid.Parse("f77c479d-9a08-4095-b975-a1532d21d196"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("f357d00e-f14d-4b9c-8f5c-e0e8235e2648"),
            },
            new SeamResult
            {
                Id = Guid.Parse("5f9d62db-931a-4b6a-bf79-e2547100b484"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("fcbb9b82-b30c-4ff4-8f81-c5e42f84b6a9"),
            },
            new SeamResult
            {
                Id = Guid.Parse("8ca6ff5e-bf7b-4e23-a248-56f8f50bd7cf"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("fcbb9b82-b30c-4ff4-8f81-c5e42f84b6a9"),
            },
            new SeamResult
            {
                Id = Guid.Parse("aba6c0b0-4b1d-4a57-a175-a38508cf1681"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("9d5ad775-da4f-4f31-b637-fee1e6a7052c"),
            },
            new SeamResult
            {
                Id = Guid.Parse("bef10ab0-bd74-40b2-9899-f6305dd53f67"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("4db44c6a-636a-49be-9669-e8d244263829"),
            },
            new SeamResult
            {
                Id = Guid.Parse("0c196b1e-95d3-43c1-9db4-074592e512c6"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("c3502697-fe6a-4c08-bc9d-4000507f94ec"),
            },
            new SeamResult
            {
                Id = Guid.Parse("0ccb6e3e-58c3-424d-b9a7-cc237ecaf298"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("f041bce5-7e21-482b-a31a-40f30ddc5687"),
            },
            new SeamResult
            {
                Id = Guid.Parse("17a3fdb7-e849-4ba3-b05d-5114b50ce5f4"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("5c33fcfe-c6eb-4be9-9a7e-831e417d3281"),
            },
            new SeamResult
            {
                Id = Guid.Parse("1b5fae3b-caf4-4299-8097-3ab9028e9fb8"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("b2bd3679-74a4-4bf3-9b1f-42526f9871e5"),
            },
            new SeamResult
            {
                Id = Guid.Parse("259d43d5-2332-472a-b5eb-2bff9197bebb"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("eee79665-3549-4720-92dd-2b2d8c91810b"),
            },
            new SeamResult
            {
                Id = Guid.Parse("26509099-d26b-4142-8cbd-c3fdd5a04bfe"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("97c39db1-23a3-43bb-87a0-ab4fde96797b"),
            },
            new SeamResult
            {
                Id = Guid.Parse("27ccb298-b16e-40db-a5b3-04a9672f051b"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("cbd7b07d-08af-4f95-bf87-6456a7a134cf"),
            },
            new SeamResult
            {
                Id = Guid.Parse("34f943c8-96a2-4f0e-9ef3-51c91600d330"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("c3502697-fe6a-4c08-bc9d-4000507f94ec"),
            },
            new SeamResult
            {
                Id = Guid.Parse("40afa6a3-ed76-41f1-aeab-fa9221fa3e78"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("f041bce5-7e21-482b-a31a-40f30ddc5687"),
            },
            new SeamResult
            {
                Id = Guid.Parse("48c7b411-e5a7-4ab6-991e-12d962476290"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("5c33fcfe-c6eb-4be9-9a7e-831e417d3281"),
            },
            new SeamResult
            {
                Id = Guid.Parse("4c25a00c-596c-43dc-97b5-3b3b87c4aa28"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("eee79665-3549-4720-92dd-2b2d8c91810b"),
            },
            new SeamResult
            {
                Id = Guid.Parse("4cba0d45-3cb8-4e2b-8ee4-f44c5dd57c97"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("11d1254a-2e8e-49eb-afa4-3f92164e6922"),
            },
            new SeamResult
            {
                Id = Guid.Parse("4d0f61c1-0a21-44ab-af5b-4e63bb5bfd6c"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("79d3738d-3b47-4bf7-92ea-a93312929968"),
            },
            new SeamResult
            {
                Id = Guid.Parse("4d920991-a1c0-4c7e-9bcf-995f925c0aec"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("79d3738d-3b47-4bf7-92ea-a93312929968"),
            },
            new SeamResult
            {
                Id = Guid.Parse("55c3b528-2448-4f91-9e61-815c65a1f009"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("5c33fcfe-c6eb-4be9-9a7e-831e417d3281"),
            },
            new SeamResult
            {
                Id = Guid.Parse("569c5145-3073-44b6-8d39-4bee095204e1"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("b6e312dd-7e3b-42a1-9548-615c0a1cdd8b"),
            },
            new SeamResult
            {
                Id = Guid.Parse("62ac9027-4eab-44bf-a47b-aee60b2c328e"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("0e891569-280e-43ac-affd-6a9f769ca8ff"),
            },
            new SeamResult
            {
                Id = Guid.Parse("6d45d7cf-4200-4e30-b840-9a8dc98767cc"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("79d3738d-3b47-4bf7-92ea-a93312929968"),
            },
            new SeamResult
            {
                Id = Guid.Parse("6fedba72-14ef-4ba6-87de-94cdb8609af1"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("c3502697-fe6a-4c08-bc9d-4000507f94ec"),
            },
            new SeamResult
            {
                Id = Guid.Parse("7afbfb64-6b17-423a-8a97-f446cdbabd1c"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("0bf54632-e454-4249-a9d8-20214a2a2717"),
            },
            new SeamResult
            {
                Id = Guid.Parse("873736e3-d6a6-47d4-b9cb-7cd1236d2112"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("1a2e812f-6974-44f6-b63d-2aed7ec9ab69"),
            },
            new SeamResult
            {
                Id = Guid.Parse("87c6acfc-aeb0-4b1b-b250-561ea9377373"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("1a2e812f-6974-44f6-b63d-2aed7ec9ab69"),
            },
            new SeamResult
            {
                Id = Guid.Parse("8d3acf7f-7365-408e-b857-4a749b7d8b39"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("68e4b32f-2c25-403c-b306-cac21c64a3dd"),
            },
            new SeamResult
            {
                Id = Guid.Parse("9445348b-722d-45dd-bbad-2ba20081985d"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("8b0f2eb4-19fa-4449-b79d-e1649e67322a"),
            },
            new SeamResult
            {
                Id = Guid.Parse("98152abb-720c-4854-a46c-4abb29c6d374"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("ef50323e-c4e5-463c-b10e-1cdd821ba51d"),
            },
            new SeamResult
            {
                Id = Guid.Parse("9c61dd7d-4630-4659-8b77-788f9b876547"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("e743a948-677b-4b19-a77a-1bf8bd13ac27"),
            },
            new SeamResult
            {
                Id = Guid.Parse("9d709897-feb2-4cdc-b4e4-aec5d5f7d76d"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("eee79665-3549-4720-92dd-2b2d8c91810b"),
            },
            new SeamResult
            {
                Id = Guid.Parse("9e20b46d-dd4d-4f27-ac3b-b07b9238180f"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("0bf54632-e454-4249-a9d8-20214a2a2717"),
            },
            new SeamResult
            {
                Id = Guid.Parse("a11e882f-f190-4585-b2da-1aca7e53f00f"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("0bf54632-e454-4249-a9d8-20214a2a2717"),
            },
            new SeamResult
            {
                Id = Guid.Parse("ad05d539-f97c-428e-a12a-d55ea6589790"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("68e4b32f-2c25-403c-b306-cac21c64a3dd"),
            },
            new SeamResult
            {
                Id = Guid.Parse("b0b82fc8-d219-4cd4-874b-eadf4477f31b"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("68e4b32f-2c25-403c-b306-cac21c64a3dd"),
            },
            new SeamResult
            {
                Id = Guid.Parse("c28b77c8-bb4d-417e-a7fa-9d9c4a011f60"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("b6e312dd-7e3b-42a1-9548-615c0a1cdd8b"),
            },
            new SeamResult
            {
                Id = Guid.Parse("c68e72c0-8384-47d3-af19-2f7487b08aec"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("1a2e812f-6974-44f6-b63d-2aed7ec9ab69"),
            },
            new SeamResult
            {
                Id = Guid.Parse("d7f59707-945a-4fa0-85d4-492964116e73"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("ba63db71-0bb5-433a-98dc-8165cecf78ad"),
            },
            new SeamResult
            {
                Id = Guid.Parse("ee18ba7e-2fbc-49b1-b681-a983542b2546"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("b6e312dd-7e3b-42a1-9548-615c0a1cdd8b"),
            },
            new SeamResult
            {
                Id = Guid.Parse("f82430fd-05a2-4dcf-bf6a-bdbabb0f530e"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("f041bce5-7e21-482b-a31a-40f30ddc5687"),
            },
            new SeamResult
            {
                Id = Guid.Parse("01728f11-55e9-419b-9eca-aa431c251c72"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("97c39db1-23a3-43bb-87a0-ab4fde96797b"),
            },
            new SeamResult
            {
                Id = Guid.Parse("258f9495-e6dd-422b-b584-b8dc222a13f0"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("11d1254a-2e8e-49eb-afa4-3f92164e6922"),
            },
            new SeamResult
            {
                Id = Guid.Parse("63a3223b-35eb-4d1b-86cc-a1758471c40f"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("8b0f2eb4-19fa-4449-b79d-e1649e67322a"),
            },
            new SeamResult
            {
                Id = Guid.Parse("6fd1ec4a-90fc-4fee-a0c7-bd8c06e67084"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("ef50323e-c4e5-463c-b10e-1cdd821ba51d"),
            },
            new SeamResult
            {
                Id = Guid.Parse("8389c4ab-2f63-4b70-aa63-96841cb89e0f"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("cbd7b07d-08af-4f95-bf87-6456a7a134cf"),
            },
            new SeamResult
            {
                Id = Guid.Parse("efe9f538-e817-4bda-90ba-07270e599bf4"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("b2bd3679-74a4-4bf3-9b1f-42526f9871e5"),
            },
            new SeamResult
            {
                Id = Guid.Parse("789d7872-6c29-41f3-a48f-a0d16ac15ab3"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("97c39db1-23a3-43bb-87a0-ab4fde96797b"),
            },
            new SeamResult
            {
                Id = Guid.Parse("84de50c0-1fa9-4b49-bbc8-652e2ab080fa"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("b2bd3679-74a4-4bf3-9b1f-42526f9871e5"),
            },
            new SeamResult
            {
                Id = Guid.Parse("857e9046-6edb-41dc-8f26-d38cc96fe011"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("11d1254a-2e8e-49eb-afa4-3f92164e6922"),
            },
            new SeamResult
            {
                Id = Guid.Parse("8ef73dc7-f0e4-43b5-b34d-7745aea3e9fc"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("cbd7b07d-08af-4f95-bf87-6456a7a134cf"),
            },
            new SeamResult
            {
                Id = Guid.Parse("cd3eb1d8-5ea9-482c-9bf4-0ce259738ac7"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("ef50323e-c4e5-463c-b10e-1cdd821ba51d"),
            },
            new SeamResult
            {
                Id = Guid.Parse("f92dd917-67e0-4185-b542-85d6b01a22ce"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("8b0f2eb4-19fa-4449-b79d-e1649e67322a"),
            },
            new SeamResult
            {
                Id = Guid.Parse("61fc3510-0c06-4b3b-a775-d235c47a7245"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("ba63db71-0bb5-433a-98dc-8165cecf78ad"),
            },
            new SeamResult
            {
                Id = Guid.Parse("a5a01d66-ae59-4c0d-815b-c45d143c9401"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("e743a948-677b-4b19-a77a-1bf8bd13ac27"),
            },
            new SeamResult
            {
                Id = Guid.Parse("e58889c3-ab40-4819-abef-423090b69107"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("0e891569-280e-43ac-affd-6a9f769ca8ff"),
            },
            new SeamResult
            {
                Id = Guid.Parse("3cc2453c-02d1-45d3-9fc2-ed1e9e2c62ca"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("ba63db71-0bb5-433a-98dc-8165cecf78ad"),
            },
            new SeamResult
            {
                Id = Guid.Parse("475c1c8a-45ff-4776-8709-f808d635ef71"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("e743a948-677b-4b19-a77a-1bf8bd13ac27"),
            },
            new SeamResult
            {
                Id = Guid.Parse("6c577f92-c2d7-4d23-88cf-b89aa837143b"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("0e891569-280e-43ac-affd-6a9f769ca8ff"),
            },
        };

        return seamResults;
    }
}