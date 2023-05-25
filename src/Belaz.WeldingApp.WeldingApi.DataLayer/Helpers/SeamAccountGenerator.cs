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
                Id = Guid.Parse("051a19c3-5628-4d43-b39a-4ad717946f5a"),
                DateFromPlan = new DateTime(638187552000000000),
                SeamId = Guid.Parse("7d83ba4e-5b00-4935-baf1-df3ad86b15c8"),
                ProductAccountId = Guid.Parse("4b5a29f7-2166-4200-961a-100d0dcc9919"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("091df164-48ab-4961-a22b-1d872a61daac"),
                DateFromPlan = new DateTime(638141760000000000),
                SeamId = Guid.Parse("03876726-8de8-486d-a01b-50b644cc76f1"),
                ProductAccountId = Guid.Parse("e7fd7a7a-089e-4bbf-9018-4ffd11db0187"),
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
                Id = Guid.Parse("0d6ddde9-3469-4c4a-8dc3-74c3e07cb9b6"),
                DateFromPlan = new DateTime(638185824000000000),
                SeamId = Guid.Parse("a3b759d7-555a-41ea-93bf-2d9c7ce48371"),
                ProductAccountId = Guid.Parse("aed91b3d-b3d9-4340-9b6c-63a55199b0b6"),
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
                Id = Guid.Parse("0dfe2399-755a-4beb-b686-40214d966dd6"),
                DateFromPlan = new DateTime(638185824000000000),
                SeamId = Guid.Parse("b7703aeb-535a-4be2-a171-b71fbe3cec42"),
                ProductAccountId = Guid.Parse("aed91b3d-b3d9-4340-9b6c-63a55199b0b6"),
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
                Id = Guid.Parse("15cc8a1f-2440-4bdd-9caf-846b3db51068"),
                DateFromPlan = new DateTime(638175456000000000),
                SeamId = Guid.Parse("b04049d0-5026-4014-bd26-e61dbd0bda14"),
                ProductAccountId = Guid.Parse("ecb64aac-a835-48f6-a785-fd38a746453a"),
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
                Id = Guid.Parse("1bfa9837-467e-442d-98bd-9222db9152f9"),
                DateFromPlan = new DateTime(638186688000000000),
                SeamId = Guid.Parse("1b6a85ad-6da0-4269-a86f-180ec363cb9e"),
                ProductAccountId = Guid.Parse("a83c8cbe-4557-4a22-bacf-a316c760e7b6"),
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
                Id = Guid.Parse("21009ef9-6b0e-418a-8254-0df8c40fdd26"),
                DateFromPlan = new DateTime(638186688000000000),
                SeamId = Guid.Parse("c4309e97-a1e8-49de-b124-c1aa1e89de8a"),
                ProductAccountId = Guid.Parse("bde7f54c-ad95-452c-a4e8-be272521a384"),
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
                Id = Guid.Parse("2ac04518-7a7e-4e36-b680-ee817d1eaa86"),
                DateFromPlan = new DateTime(638186688000000000),
                SeamId = Guid.Parse("05d627b6-e193-4251-88b9-635cba1b9370"),
                ProductAccountId = Guid.Parse("a83c8cbe-4557-4a22-bacf-a316c760e7b6"),
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
                Id = Guid.Parse("3ac363fb-d192-485a-aa60-33b73951193a"),
                DateFromPlan = new DateTime(638175456000000000),
                SeamId = Guid.Parse("1b6a85ad-6da0-4269-a86f-180ec363cb9e"),
                ProductAccountId = Guid.Parse("278c5233-0b66-4144-afdc-b45af2d868e5"),
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
                Id = Guid.Parse("3e7c2f83-0fd0-4d2c-aa9e-442a68e924a0"),
                DateFromPlan = new DateTime(638186688000000000),
                SeamId = Guid.Parse("b04049d0-5026-4014-bd26-e61dbd0bda14"),
                ProductAccountId = Guid.Parse("007c0696-7942-48dd-b487-8a27ec1a2205"),
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
                Id = Guid.Parse("43517b65-b3ec-492f-801d-cff9b4a52b93"),
                DateFromPlan = new DateTime(638175456000000000),
                SeamId = Guid.Parse("3e55080c-fc22-4c5a-ac4e-a0dc4cbb67e1"),
                ProductAccountId = Guid.Parse("89026249-cc33-4ee3-a542-181e50e0e486"),
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
                Id = Guid.Parse("46d533fa-acc5-4ec7-ab36-7afee024020b"),
                DateFromPlan = new DateTime(638188416000000000),
                SeamId = Guid.Parse("ace294ec-b133-4fcb-aca8-7bdefef745f1"),
                ProductAccountId = Guid.Parse("b41e536d-aac0-4b63-a4e7-62498a5576b8"),
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
                Id = Guid.Parse("51e700f7-d668-4ecc-b991-8fa66a395bba"),
                DateFromPlan = new DateTime(638185824000000000),
                SeamId = Guid.Parse("c07e6c99-6ab0-4e57-8ea3-53bb68ffa507"),
                ProductAccountId = Guid.Parse("49bdc8a7-b421-4300-82a4-c6df552860b3"),
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
                Id = Guid.Parse("54ff147e-247d-44b4-9dff-d854474ccd4a"),
                DateFromPlan = new DateTime(638185824000000000),
                SeamId = Guid.Parse("f43dc5cf-191d-4ba5-ab5f-5865f73589e0"),
                ProductAccountId = Guid.Parse("aed91b3d-b3d9-4340-9b6c-63a55199b0b6"),
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
                Id = Guid.Parse("55e90118-e490-4e3c-90cc-38c85926aeb4"),
                DateFromPlan = new DateTime(638175456000000000),
                SeamId = Guid.Parse("3af46b20-224a-4f72-97b6-5297d2b75bf5"),
                ProductAccountId = Guid.Parse("ecb64aac-a835-48f6-a785-fd38a746453a"),
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
                Id = Guid.Parse("5773e326-ab06-44c7-bc38-3763fecdabbe"),
                DateFromPlan = new DateTime(638187552000000000),
                SeamId = Guid.Parse("b7703aeb-535a-4be2-a171-b71fbe3cec42"),
                ProductAccountId = Guid.Parse("20af1dc0-ed6e-4ab3-9199-92650a60da89"),
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
                Id = Guid.Parse("5c33fcfe-c6eb-4be9-9a7e-831e417d3281"),
                DateFromPlan = new DateTime(638192736000000000),
                SeamId = Guid.Parse("c4309e97-a1e8-49de-b124-c1aa1e89de8a"),
                ProductAccountId = Guid.Parse("433f7da5-156f-453b-af97-789fb128ca18"),
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
                Id = Guid.Parse("6549760a-d9fb-4ea6-9efe-761552343255"),
                DateFromPlan = new DateTime(638186688000000000),
                SeamId = Guid.Parse("dfbf3824-def3-485b-b5af-66c0fcd1adca"),
                ProductAccountId = Guid.Parse("bde7f54c-ad95-452c-a4e8-be272521a384"),
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
                Id = Guid.Parse("674b652d-2065-48b7-bf89-aacc430ea1db"),
                DateFromPlan = new DateTime(638188416000000000),
                SeamId = Guid.Parse("1b6a85ad-6da0-4269-a86f-180ec363cb9e"),
                ProductAccountId = Guid.Parse("58d52329-bb4d-4cca-bcf5-2b4ff8fe3b90"),
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
                Id = Guid.Parse("68a29e4c-20aa-40da-8b43-be876fad5cc5"),
                DateFromPlan = new DateTime(638186688000000000),
                SeamId = Guid.Parse("03876726-8de8-486d-a01b-50b644cc76f1"),
                ProductAccountId = Guid.Parse("007c0696-7942-48dd-b487-8a27ec1a2205"),
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
                Id = Guid.Parse("6b1e2b36-2ceb-4460-af6c-fb93186d12d4"),
                DateFromPlan = new DateTime(638175456000000000),
                SeamId = Guid.Parse("05d627b6-e193-4251-88b9-635cba1b9370"),
                ProductAccountId = Guid.Parse("278c5233-0b66-4144-afdc-b45af2d868e5"),
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
                Id = Guid.Parse("70e49a41-7c35-496d-b60b-291450133659"),
                DateFromPlan = new DateTime(638188416000000000),
                SeamId = Guid.Parse("d8955c29-4257-4705-afc3-552316d0e8bf"),
                ProductAccountId = Guid.Parse("58d52329-bb4d-4cca-bcf5-2b4ff8fe3b90"),
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
                Id = Guid.Parse("722650c1-d999-492f-a795-6692f0878f5d"),
                DateFromPlan = new DateTime(638141760000000000),
                SeamId = Guid.Parse("3e55080c-fc22-4c5a-ac4e-a0dc4cbb67e1"),
                ProductAccountId = Guid.Parse("922415ed-0a30-4715-a1b2-c516a7306b8f"),
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
                Id = Guid.Parse("76469742-0e97-4389-841b-abb858f149d5"),
                DateFromPlan = new DateTime(638186688000000000),
                SeamId = Guid.Parse("3af46b20-224a-4f72-97b6-5297d2b75bf5"),
                ProductAccountId = Guid.Parse("007c0696-7942-48dd-b487-8a27ec1a2205"),
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
                Id = Guid.Parse("77f692ec-1e8d-4dfc-b25c-b4c66fc59404"),
                DateFromPlan = new DateTime(638141760000000000),
                SeamId = Guid.Parse("c4309e97-a1e8-49de-b124-c1aa1e89de8a"),
                ProductAccountId = Guid.Parse("922415ed-0a30-4715-a1b2-c516a7306b8f"),
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
                Id = Guid.Parse("79ae86eb-f645-4b4b-9694-818f53de97e8"),
                DateFromPlan = new DateTime(638185824000000000),
                SeamId = Guid.Parse("05d627b6-e193-4251-88b9-635cba1b9370"),
                ProductAccountId = Guid.Parse("aed91b3d-b3d9-4340-9b6c-63a55199b0b6"),
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
                Id = Guid.Parse("7f92d503-300d-42f7-99aa-092c1d36d969"),
                DateFromPlan = new DateTime(638141760000000000),
                SeamId = Guid.Parse("a3b759d7-555a-41ea-93bf-2d9c7ce48371"),
                ProductAccountId = Guid.Parse("c9006ce7-51a1-45d9-857f-fb00b95f98bf"),
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
                Id = Guid.Parse("853fd777-78b5-49ef-baee-12025f00b4c3"),
                DateFromPlan = new DateTime(638188416000000000),
                SeamId = Guid.Parse("7d83ba4e-5b00-4935-baf1-df3ad86b15c8"),
                ProductAccountId = Guid.Parse("b41e536d-aac0-4b63-a4e7-62498a5576b8"),
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
                Id = Guid.Parse("8b0f2eb4-19fa-4449-b79d-e1649e67322a"),
                DateFromPlan = new DateTime(638192736000000000),
                SeamId = Guid.Parse("b275eb65-ca76-4272-9662-d9b92e109177"),
                ProductAccountId = Guid.Parse("23949c10-258c-4603-8369-ba77fa1660f9"),
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
                Id = Guid.Parse("8fa8094e-1d6a-46e9-a2a0-5145407d2870"),
                DateFromPlan = new DateTime(638175456000000000),
                SeamId = Guid.Parse("dfbf3824-def3-485b-b5af-66c0fcd1adca"),
                ProductAccountId = Guid.Parse("89026249-cc33-4ee3-a542-181e50e0e486"),
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
                Id = Guid.Parse("97c39db1-23a3-43bb-87a0-ab4fde96797b"),
                DateFromPlan = new DateTime(638192736000000000),
                SeamId = Guid.Parse("3af46b20-224a-4f72-97b6-5297d2b75bf5"),
                ProductAccountId = Guid.Parse("23949c10-258c-4603-8369-ba77fa1660f9"),
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
                Id = Guid.Parse("a3ec12f4-0cb9-4fab-9dba-ddeb90011ae6"),
                DateFromPlan = new DateTime(638187552000000000),
                SeamId = Guid.Parse("f43dc5cf-191d-4ba5-ab5f-5865f73589e0"),
                ProductAccountId = Guid.Parse("20af1dc0-ed6e-4ab3-9199-92650a60da89"),
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
                Id = Guid.Parse("a57e6340-096c-4afa-a362-568ec2782600"),
                DateFromPlan = new DateTime(638187552000000000),
                SeamId = Guid.Parse("03876726-8de8-486d-a01b-50b644cc76f1"),
                ProductAccountId = Guid.Parse("4b5a29f7-2166-4200-961a-100d0dcc9919"),
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
                Id = Guid.Parse("acae688f-3fc8-47e7-8396-5dfaa74ae6b3"),
                DateFromPlan = new DateTime(638141760000000000),
                SeamId = Guid.Parse("b275eb65-ca76-4272-9662-d9b92e109177"),
                ProductAccountId = Guid.Parse("e7fd7a7a-089e-4bbf-9018-4ffd11db0187"),
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
                Id = Guid.Parse("b76c4260-0d58-4376-b624-1a8a0bf017aa"),
                DateFromPlan = new DateTime(638188416000000000),
                SeamId = Guid.Parse("b275eb65-ca76-4272-9662-d9b92e109177"),
                ProductAccountId = Guid.Parse("b41e536d-aac0-4b63-a4e7-62498a5576b8"),
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
                Id = Guid.Parse("ba63db71-0bb5-433a-98dc-8165cecf78ad"),
                DateFromPlan = new DateTime(638192736000000000),
                SeamId = Guid.Parse("6eb38dfc-df1a-42c4-8b12-f9956cad632e"),
                ProductAccountId = Guid.Parse("8e56b836-6929-4ecf-b7ea-a0b7d8f9dd81"),
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
                Id = Guid.Parse("bf9c2b23-4540-4fc4-8e3b-61c18bfdecae"),
                DateFromPlan = new DateTime(638187552000000000),
                SeamId = Guid.Parse("dfbf3824-def3-485b-b5af-66c0fcd1adca"),
                ProductAccountId = Guid.Parse("6cc80ba9-c787-4d50-9026-0bc1dc3c0544"),
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
                Id = Guid.Parse("c3502697-fe6a-4c08-bc9d-4000507f94ec"),
                DateFromPlan = new DateTime(638192736000000000),
                SeamId = Guid.Parse("d8955c29-4257-4705-afc3-552316d0e8bf"),
                ProductAccountId = Guid.Parse("90e8eaee-b343-4a1a-bf0f-80b94eeefb43"),
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
                Id = Guid.Parse("cbd7b07d-08af-4f95-bf87-6456a7a134cf"),
                DateFromPlan = new DateTime(638192736000000000),
                SeamId = Guid.Parse("b04049d0-5026-4014-bd26-e61dbd0bda14"),
                ProductAccountId = Guid.Parse("23949c10-258c-4603-8369-ba77fa1660f9"),
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
                Id = Guid.Parse("e1ad50e6-3cce-498a-9c30-a125df2783ae"),
                DateFromPlan = new DateTime(638141760000000000),
                SeamId = Guid.Parse("1b6a85ad-6da0-4269-a86f-180ec363cb9e"),
                ProductAccountId = Guid.Parse("c9006ce7-51a1-45d9-857f-fb00b95f98bf"),
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
                Id = Guid.Parse("e4f94509-e1e9-43d3-9cc2-f2be46eaee26"),
                DateFromPlan = new DateTime(638188416000000000),
                SeamId = Guid.Parse("b7703aeb-535a-4be2-a171-b71fbe3cec42"),
                ProductAccountId = Guid.Parse("58d52329-bb4d-4cca-bcf5-2b4ff8fe3b90"),
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
                Id = Guid.Parse("e75725ce-9c6d-46cd-ae16-a86d4b822972"),
                DateFromPlan = new DateTime(638185824000000000),
                SeamId = Guid.Parse("b275eb65-ca76-4272-9662-d9b92e109177"),
                ProductAccountId = Guid.Parse("a7a06d59-183f-4821-8c03-34b3507c6c9c"),
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
                Id = Guid.Parse("ea2dbfaf-a88b-4646-9444-f29592c84871"),
                DateFromPlan = new DateTime(638141760000000000),
                SeamId = Guid.Parse("b7703aeb-535a-4be2-a171-b71fbe3cec42"),
                ProductAccountId = Guid.Parse("c9006ce7-51a1-45d9-857f-fb00b95f98bf"),
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
                Id = Guid.Parse("ece10748-bd4d-4a24-8cd1-c3fe8e9679ed"),
                DateFromPlan = new DateTime(638186688000000000),
                SeamId = Guid.Parse("6eb38dfc-df1a-42c4-8b12-f9956cad632e"),
                ProductAccountId = Guid.Parse("3d5b760a-7e7e-41df-8be2-b1907d184af7"),
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
                Id = Guid.Parse("eee79665-3549-4720-92dd-2b2d8c91810b"),
                DateFromPlan = new DateTime(638192736000000000),
                SeamId = Guid.Parse("a3b759d7-555a-41ea-93bf-2d9c7ce48371"),
                ProductAccountId = Guid.Parse("90e8eaee-b343-4a1a-bf0f-80b94eeefb43"),
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
                Id = Guid.Parse("f2c7a58a-a9f6-4489-94a5-7549ce07efdd"),
                DateFromPlan = new DateTime(638187552000000000),
                SeamId = Guid.Parse("3e55080c-fc22-4c5a-ac4e-a0dc4cbb67e1"),
                ProductAccountId = Guid.Parse("6cc80ba9-c787-4d50-9026-0bc1dc3c0544"),
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
                Id = Guid.Parse("fb19a111-0bdf-474f-8d1d-8dcc3c7fc078"),
                DateFromPlan = new DateTime(638187552000000000),
                SeamId = Guid.Parse("b275eb65-ca76-4272-9662-d9b92e109177"),
                ProductAccountId = Guid.Parse("4b5a29f7-2166-4200-961a-100d0dcc9919"),
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
                Id = Guid.Parse("ff1d28a6-7900-4218-92d4-dab56392fc1a"),
                DateFromPlan = new DateTime(638185824000000000),
                SeamId = Guid.Parse("03876726-8de8-486d-a01b-50b644cc76f1"),
                ProductAccountId = Guid.Parse("a7a06d59-183f-4821-8c03-34b3507c6c9c"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("1dc87fa3-2f08-4601-9598-9f09e3da21d7"),
                DateFromPlan = new DateTime(638195328000000000),
                SeamId = Guid.Parse("dfbf3824-def3-485b-b5af-66c0fcd1adca"),
                ProductAccountId = Guid.Parse("37d2af17-8237-449d-af54-1a96718918d2"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("3fb2d95a-f1bf-4970-8ee8-7e89c0882c1f"),
                DateFromPlan = new DateTime(638195328000000000),
                SeamId = Guid.Parse("05d627b6-e193-4251-88b9-635cba1b9370"),
                ProductAccountId = Guid.Parse("897ac7a4-f940-40c1-996d-e5726afd6f0b"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("45065674-1529-4c2a-b577-bd7c01df4e1e"),
                DateFromPlan = new DateTime(638195328000000000),
                SeamId = Guid.Parse("b275eb65-ca76-4272-9662-d9b92e109177"),
                ProductAccountId = Guid.Parse("f34a2925-2f18-4312-b04f-d0f8e5d7b4f2"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("4d0a852e-d8d7-4611-a2e1-cdca2ec16c40"),
                DateFromPlan = new DateTime(638195328000000000),
                SeamId = Guid.Parse("7d83ba4e-5b00-4935-baf1-df3ad86b15c8"),
                ProductAccountId = Guid.Parse("f34a2925-2f18-4312-b04f-d0f8e5d7b4f2"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("5054ae70-7845-49b1-8490-72a05f9ddf63"),
                DateFromPlan = new DateTime(638195328000000000),
                SeamId = Guid.Parse("ace294ec-b133-4fcb-aca8-7bdefef745f1"),
                ProductAccountId = Guid.Parse("f34a2925-2f18-4312-b04f-d0f8e5d7b4f2"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("59e8a89e-122c-4f45-b480-f344736195e5"),
                DateFromPlan = new DateTime(638195328000000000),
                SeamId = Guid.Parse("a3b759d7-555a-41ea-93bf-2d9c7ce48371"),
                ProductAccountId = Guid.Parse("897ac7a4-f940-40c1-996d-e5726afd6f0b"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("74f96cb9-7031-4cf3-86a9-d06a0b9f304b"),
                DateFromPlan = new DateTime(638195328000000000),
                SeamId = Guid.Parse("c4309e97-a1e8-49de-b124-c1aa1e89de8a"),
                ProductAccountId = Guid.Parse("37d2af17-8237-449d-af54-1a96718918d2"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("7a31eb37-7f82-484b-abd9-3bfc0e6761a8"),
                DateFromPlan = new DateTime(638195328000000000),
                SeamId = Guid.Parse("3af46b20-224a-4f72-97b6-5297d2b75bf5"),
                ProductAccountId = Guid.Parse("f34a2925-2f18-4312-b04f-d0f8e5d7b4f2"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("a27199e8-70e7-464c-bd20-3fdd6360b5a8"),
                DateFromPlan = new DateTime(638195328000000000),
                SeamId = Guid.Parse("6eb38dfc-df1a-42c4-8b12-f9956cad632e"),
                ProductAccountId = Guid.Parse("acc866a3-0d5b-4ec2-a300-1680446b979f"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("af2523a2-62c4-42ce-a438-0ebfd69471d0"),
                DateFromPlan = new DateTime(638195328000000000),
                SeamId = Guid.Parse("03876726-8de8-486d-a01b-50b644cc76f1"),
                ProductAccountId = Guid.Parse("f34a2925-2f18-4312-b04f-d0f8e5d7b4f2"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("b49e2a92-5cf1-415f-9ac1-617163e1bc09"),
                DateFromPlan = new DateTime(638195328000000000),
                SeamId = Guid.Parse("d8955c29-4257-4705-afc3-552316d0e8bf"),
                ProductAccountId = Guid.Parse("897ac7a4-f940-40c1-996d-e5726afd6f0b"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("b58243ac-0276-449f-9d0b-5e1344002a00"),
                DateFromPlan = new DateTime(638195328000000000),
                SeamId = Guid.Parse("b7703aeb-535a-4be2-a171-b71fbe3cec42"),
                ProductAccountId = Guid.Parse("897ac7a4-f940-40c1-996d-e5726afd6f0b"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("b7cfc901-1bb5-4b4a-a282-70056517ebb3"),
                DateFromPlan = new DateTime(638195328000000000),
                SeamId = Guid.Parse("f43dc5cf-191d-4ba5-ab5f-5865f73589e0"),
                ProductAccountId = Guid.Parse("897ac7a4-f940-40c1-996d-e5726afd6f0b"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("c0a6379f-f3a4-408b-ba14-fe2d0e88a448"),
                DateFromPlan = new DateTime(638195328000000000),
                SeamId = Guid.Parse("dc631901-db09-4add-9e04-3e5e006c2271"),
                ProductAccountId = Guid.Parse("acc866a3-0d5b-4ec2-a300-1680446b979f"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("cebf72e8-768c-4300-a232-8a753843b867"),
                DateFromPlan = new DateTime(638195328000000000),
                SeamId = Guid.Parse("3e55080c-fc22-4c5a-ac4e-a0dc4cbb67e1"),
                ProductAccountId = Guid.Parse("37d2af17-8237-449d-af54-1a96718918d2"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("e3cf2a8c-aa76-4792-842c-985634c8bf67"),
                DateFromPlan = new DateTime(638195328000000000),
                SeamId = Guid.Parse("b04049d0-5026-4014-bd26-e61dbd0bda14"),
                ProductAccountId = Guid.Parse("f34a2925-2f18-4312-b04f-d0f8e5d7b4f2"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("f326cc79-f7a9-4d35-ac06-0226a0ff5149"),
                DateFromPlan = new DateTime(638195328000000000),
                SeamId = Guid.Parse("1b6a85ad-6da0-4269-a86f-180ec363cb9e"),
                ProductAccountId = Guid.Parse("897ac7a4-f940-40c1-996d-e5726afd6f0b"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("f8f1776e-3052-49e4-a46f-204985183d38"),
                DateFromPlan = new DateTime(638195328000000000),
                SeamId = Guid.Parse("c07e6c99-6ab0-4e57-8ea3-53bb68ffa507"),
                ProductAccountId = Guid.Parse("acc866a3-0d5b-4ec2-a300-1680446b979f"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("04cf134f-238e-41f5-8a45-cba19dfe76bf"),
                DateFromPlan = new DateTime(638197056000000000),
                SeamId = Guid.Parse("b275eb65-ca76-4272-9662-d9b92e109177"),
                ProductAccountId = Guid.Parse("200e8ee4-8436-48dd-9917-e0523611c453"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("09aa7df6-34f9-4511-869c-e05bd378bea3"),
                DateFromPlan = new DateTime(638197056000000000),
                SeamId = Guid.Parse("6eb38dfc-df1a-42c4-8b12-f9956cad632e"),
                ProductAccountId = Guid.Parse("d58bc995-6b75-4c33-926d-59023a1072c7"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("130b1383-1175-4ce5-bc98-77c733773236"),
                DateFromPlan = new DateTime(638197056000000000),
                SeamId = Guid.Parse("05d627b6-e193-4251-88b9-635cba1b9370"),
                ProductAccountId = Guid.Parse("597187c5-dd40-4433-a4c6-074013308e80"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("2746fa18-b544-47d4-ab17-1d3d9fd1976b"),
                DateFromPlan = new DateTime(638197056000000000),
                SeamId = Guid.Parse("ace294ec-b133-4fcb-aca8-7bdefef745f1"),
                ProductAccountId = Guid.Parse("200e8ee4-8436-48dd-9917-e0523611c453"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("33132c63-5c9c-4e16-ad2a-eb6fb60cb222"),
                DateFromPlan = new DateTime(638197056000000000),
                SeamId = Guid.Parse("d8955c29-4257-4705-afc3-552316d0e8bf"),
                ProductAccountId = Guid.Parse("597187c5-dd40-4433-a4c6-074013308e80"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("387845e7-e55d-4d35-a985-7c32e12c28d6"),
                DateFromPlan = new DateTime(638197056000000000),
                SeamId = Guid.Parse("7d83ba4e-5b00-4935-baf1-df3ad86b15c8"),
                ProductAccountId = Guid.Parse("200e8ee4-8436-48dd-9917-e0523611c453"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("5ee6731f-5947-49ec-9008-d9727c0aea9f"),
                DateFromPlan = new DateTime(638197056000000000),
                SeamId = Guid.Parse("b04049d0-5026-4014-bd26-e61dbd0bda14"),
                ProductAccountId = Guid.Parse("200e8ee4-8436-48dd-9917-e0523611c453"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("6956cb84-a66f-4911-837a-2ee9ca75772f"),
                DateFromPlan = new DateTime(638197056000000000),
                SeamId = Guid.Parse("f43dc5cf-191d-4ba5-ab5f-5865f73589e0"),
                ProductAccountId = Guid.Parse("597187c5-dd40-4433-a4c6-074013308e80"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("849aa625-1322-46db-96a0-5e53e2b49637"),
                DateFromPlan = new DateTime(638197056000000000),
                SeamId = Guid.Parse("c4309e97-a1e8-49de-b124-c1aa1e89de8a"),
                ProductAccountId = Guid.Parse("c8a3d042-64c8-47d5-81af-dcefce49893b"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("b883fc4a-9d3b-443b-b4f1-e7961742b517"),
                DateFromPlan = new DateTime(638197056000000000),
                SeamId = Guid.Parse("b7703aeb-535a-4be2-a171-b71fbe3cec42"),
                ProductAccountId = Guid.Parse("597187c5-dd40-4433-a4c6-074013308e80"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("b8e55393-d436-489c-9b9e-41a4edb846b3"),
                DateFromPlan = new DateTime(638197056000000000),
                SeamId = Guid.Parse("03876726-8de8-486d-a01b-50b644cc76f1"),
                ProductAccountId = Guid.Parse("200e8ee4-8436-48dd-9917-e0523611c453"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("bc85fbb8-8d5d-4ada-9d10-512b940a94b2"),
                DateFromPlan = new DateTime(638197056000000000),
                SeamId = Guid.Parse("dc631901-db09-4add-9e04-3e5e006c2271"),
                ProductAccountId = Guid.Parse("d58bc995-6b75-4c33-926d-59023a1072c7"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("c3f68fce-6e06-4298-83e9-b70c24de3f58"),
                DateFromPlan = new DateTime(638197056000000000),
                SeamId = Guid.Parse("c07e6c99-6ab0-4e57-8ea3-53bb68ffa507"),
                ProductAccountId = Guid.Parse("d58bc995-6b75-4c33-926d-59023a1072c7"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("c7e2e6c7-fef6-486b-a56a-4b2744eabf23"),
                DateFromPlan = new DateTime(638197056000000000),
                SeamId = Guid.Parse("3e55080c-fc22-4c5a-ac4e-a0dc4cbb67e1"),
                ProductAccountId = Guid.Parse("c8a3d042-64c8-47d5-81af-dcefce49893b"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("e0ea7f94-0adc-4c33-b720-addca64766f0"),
                DateFromPlan = new DateTime(638197056000000000),
                SeamId = Guid.Parse("3af46b20-224a-4f72-97b6-5297d2b75bf5"),
                ProductAccountId = Guid.Parse("200e8ee4-8436-48dd-9917-e0523611c453"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("e1b86536-0c78-4dc2-abb3-414cea5d1c94"),
                DateFromPlan = new DateTime(638197056000000000),
                SeamId = Guid.Parse("a3b759d7-555a-41ea-93bf-2d9c7ce48371"),
                ProductAccountId = Guid.Parse("597187c5-dd40-4433-a4c6-074013308e80"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("f067c76f-cb29-45c9-a441-28a9706a3419"),
                DateFromPlan = new DateTime(638197056000000000),
                SeamId = Guid.Parse("1b6a85ad-6da0-4269-a86f-180ec363cb9e"),
                ProductAccountId = Guid.Parse("597187c5-dd40-4433-a4c6-074013308e80"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("f73d8168-9a60-4c1b-8d70-9f0959ba433a"),
                DateFromPlan = new DateTime(638197056000000000),
                SeamId = Guid.Parse("dfbf3824-def3-485b-b5af-66c0fcd1adca"),
                ProductAccountId = Guid.Parse("c8a3d042-64c8-47d5-81af-dcefce49893b"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("027f89f9-7153-4187-b818-5f3354e045cb"),
                DateFromPlan = new DateTime(638197920000000000),
                SeamId = Guid.Parse("d8955c29-4257-4705-afc3-552316d0e8bf"),
                ProductAccountId = Guid.Parse("03a4f109-bfea-4c36-9633-51a1b3308757"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("0661a615-343c-429f-9631-d07bda6e4344"),
                DateFromPlan = new DateTime(638197920000000000),
                SeamId = Guid.Parse("f43dc5cf-191d-4ba5-ab5f-5865f73589e0"),
                ProductAccountId = Guid.Parse("03a4f109-bfea-4c36-9633-51a1b3308757"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("26293d16-c404-487c-b067-bac6ec4b4bb3"),
                DateFromPlan = new DateTime(638197920000000000),
                SeamId = Guid.Parse("dfbf3824-def3-485b-b5af-66c0fcd1adca"),
                ProductAccountId = Guid.Parse("3d164811-bb6e-4b3d-92da-3a1956e98ad7"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("4ec711b2-191d-4172-89d7-7daedcbb11f6"),
                DateFromPlan = new DateTime(638197920000000000),
                SeamId = Guid.Parse("b275eb65-ca76-4272-9662-d9b92e109177"),
                ProductAccountId = Guid.Parse("482cdeba-ea2d-4f8c-8f86-77577dc5bf3f"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("5370718d-9a3a-4d25-8eb5-5d5b6e9c1688"),
                DateFromPlan = new DateTime(638197920000000000),
                SeamId = Guid.Parse("6eb38dfc-df1a-42c4-8b12-f9956cad632e"),
                ProductAccountId = Guid.Parse("a0cbac4a-4843-488e-aac3-005fb370840f"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("5e73be8f-4bcc-462d-9a47-f26a72e06dd8"),
                DateFromPlan = new DateTime(638197920000000000),
                SeamId = Guid.Parse("c4309e97-a1e8-49de-b124-c1aa1e89de8a"),
                ProductAccountId = Guid.Parse("3d164811-bb6e-4b3d-92da-3a1956e98ad7"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("6377cdb0-1874-4d04-a1db-2e8c7b25c161"),
                DateFromPlan = new DateTime(638197920000000000),
                SeamId = Guid.Parse("3e55080c-fc22-4c5a-ac4e-a0dc4cbb67e1"),
                ProductAccountId = Guid.Parse("3d164811-bb6e-4b3d-92da-3a1956e98ad7"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("704d31be-95e2-4b87-9888-344fde635bfa"),
                DateFromPlan = new DateTime(638197920000000000),
                SeamId = Guid.Parse("b04049d0-5026-4014-bd26-e61dbd0bda14"),
                ProductAccountId = Guid.Parse("482cdeba-ea2d-4f8c-8f86-77577dc5bf3f"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("71625ce2-1b5f-41e4-bde1-3051ce15fa85"),
                DateFromPlan = new DateTime(638197920000000000),
                SeamId = Guid.Parse("1b6a85ad-6da0-4269-a86f-180ec363cb9e"),
                ProductAccountId = Guid.Parse("03a4f109-bfea-4c36-9633-51a1b3308757"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("8897832f-879c-43bd-a2b5-b7da4aa1a272"),
                DateFromPlan = new DateTime(638197920000000000),
                SeamId = Guid.Parse("ace294ec-b133-4fcb-aca8-7bdefef745f1"),
                ProductAccountId = Guid.Parse("482cdeba-ea2d-4f8c-8f86-77577dc5bf3f"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("967794af-1861-4a0a-acc7-f508d28d4668"),
                DateFromPlan = new DateTime(638197920000000000),
                SeamId = Guid.Parse("3af46b20-224a-4f72-97b6-5297d2b75bf5"),
                ProductAccountId = Guid.Parse("482cdeba-ea2d-4f8c-8f86-77577dc5bf3f"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("b0cd15cf-ecc6-4265-a20d-d396de0b64e0"),
                DateFromPlan = new DateTime(638197920000000000),
                SeamId = Guid.Parse("dc631901-db09-4add-9e04-3e5e006c2271"),
                ProductAccountId = Guid.Parse("a0cbac4a-4843-488e-aac3-005fb370840f"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("b32ffcb2-a563-4ce7-acff-927db8b6d02b"),
                DateFromPlan = new DateTime(638197920000000000),
                SeamId = Guid.Parse("a3b759d7-555a-41ea-93bf-2d9c7ce48371"),
                ProductAccountId = Guid.Parse("03a4f109-bfea-4c36-9633-51a1b3308757"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("c0a293ad-1629-4fe9-9b97-afbd8fb070ec"),
                DateFromPlan = new DateTime(638197920000000000),
                SeamId = Guid.Parse("05d627b6-e193-4251-88b9-635cba1b9370"),
                ProductAccountId = Guid.Parse("03a4f109-bfea-4c36-9633-51a1b3308757"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("c3805d4f-3b76-481c-ad1f-36652a663aaf"),
                DateFromPlan = new DateTime(638197920000000000),
                SeamId = Guid.Parse("b7703aeb-535a-4be2-a171-b71fbe3cec42"),
                ProductAccountId = Guid.Parse("03a4f109-bfea-4c36-9633-51a1b3308757"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("db69d3bc-7ad2-42ea-aa49-2241725a0c86"),
                DateFromPlan = new DateTime(638197920000000000),
                SeamId = Guid.Parse("7d83ba4e-5b00-4935-baf1-df3ad86b15c8"),
                ProductAccountId = Guid.Parse("482cdeba-ea2d-4f8c-8f86-77577dc5bf3f"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("ee0711cd-0e77-404d-a707-6a174be3c3ef"),
                DateFromPlan = new DateTime(638197920000000000),
                SeamId = Guid.Parse("03876726-8de8-486d-a01b-50b644cc76f1"),
                ProductAccountId = Guid.Parse("482cdeba-ea2d-4f8c-8f86-77577dc5bf3f"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("f08640fe-8ca3-4972-9774-91bc1e670348"),
                DateFromPlan = new DateTime(638197920000000000),
                SeamId = Guid.Parse("c07e6c99-6ab0-4e57-8ea3-53bb68ffa507"),
                ProductAccountId = Guid.Parse("a0cbac4a-4843-488e-aac3-005fb370840f"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("1be3af55-2897-4fbd-ac5f-46a0b12194b4"),
                DateFromPlan = new DateTime(638198784000000000),
                SeamId = Guid.Parse("b04049d0-5026-4014-bd26-e61dbd0bda14"),
                ProductAccountId = Guid.Parse("863d790c-81d2-4430-8819-15e4b9f2facb"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("21fa2b39-7fac-44a3-bb23-4099a48c8ac5"),
                DateFromPlan = new DateTime(638198784000000000),
                SeamId = Guid.Parse("6eb38dfc-df1a-42c4-8b12-f9956cad632e"),
                ProductAccountId = Guid.Parse("5e248637-34e2-4826-8e2e-e8a7453e08cc"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("26c87d12-adaf-4fb3-b55a-75a16ec52eb4"),
                DateFromPlan = new DateTime(638198784000000000),
                SeamId = Guid.Parse("3af46b20-224a-4f72-97b6-5297d2b75bf5"),
                ProductAccountId = Guid.Parse("863d790c-81d2-4430-8819-15e4b9f2facb"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("2f3ce90d-79f7-4b5a-b408-b09d2ad38d2d"),
                DateFromPlan = new DateTime(638198784000000000),
                SeamId = Guid.Parse("ace294ec-b133-4fcb-aca8-7bdefef745f1"),
                ProductAccountId = Guid.Parse("863d790c-81d2-4430-8819-15e4b9f2facb"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("337bd616-8030-4134-abcf-5a26f497e533"),
                DateFromPlan = new DateTime(638198784000000000),
                SeamId = Guid.Parse("b275eb65-ca76-4272-9662-d9b92e109177"),
                ProductAccountId = Guid.Parse("863d790c-81d2-4430-8819-15e4b9f2facb"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("469f1458-5d18-47d8-a57d-db9200514f1a"),
                DateFromPlan = new DateTime(638198784000000000),
                SeamId = Guid.Parse("a3b759d7-555a-41ea-93bf-2d9c7ce48371"),
                ProductAccountId = Guid.Parse("58e91017-c773-4e5f-a390-ed9939082e16"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("52706001-99aa-4810-9e4e-a65289e97746"),
                DateFromPlan = new DateTime(638198784000000000),
                SeamId = Guid.Parse("c4309e97-a1e8-49de-b124-c1aa1e89de8a"),
                ProductAccountId = Guid.Parse("05eaeb08-5379-4423-8e87-47d9665baa06"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("72f840d3-f161-4d54-91fb-8df331acb200"),
                DateFromPlan = new DateTime(638198784000000000),
                SeamId = Guid.Parse("b7703aeb-535a-4be2-a171-b71fbe3cec42"),
                ProductAccountId = Guid.Parse("58e91017-c773-4e5f-a390-ed9939082e16"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("8cfc2ff6-8f97-4d2b-9c08-c4c80acfc2d1"),
                DateFromPlan = new DateTime(638198784000000000),
                SeamId = Guid.Parse("f43dc5cf-191d-4ba5-ab5f-5865f73589e0"),
                ProductAccountId = Guid.Parse("58e91017-c773-4e5f-a390-ed9939082e16"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("942d3a98-24f1-4d2e-add7-9cefb1d59e7a"),
                DateFromPlan = new DateTime(638198784000000000),
                SeamId = Guid.Parse("03876726-8de8-486d-a01b-50b644cc76f1"),
                ProductAccountId = Guid.Parse("863d790c-81d2-4430-8819-15e4b9f2facb"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("9a26988a-7b50-4358-94bd-4ddde6ae0348"),
                DateFromPlan = new DateTime(638198784000000000),
                SeamId = Guid.Parse("d8955c29-4257-4705-afc3-552316d0e8bf"),
                ProductAccountId = Guid.Parse("58e91017-c773-4e5f-a390-ed9939082e16"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("a2650a8a-3788-4e40-a729-707247a3d33a"),
                DateFromPlan = new DateTime(638198784000000000),
                SeamId = Guid.Parse("05d627b6-e193-4251-88b9-635cba1b9370"),
                ProductAccountId = Guid.Parse("58e91017-c773-4e5f-a390-ed9939082e16"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("a68c6ac4-b2ca-4d06-bf33-aea364b8a5c0"),
                DateFromPlan = new DateTime(638198784000000000),
                SeamId = Guid.Parse("dc631901-db09-4add-9e04-3e5e006c2271"),
                ProductAccountId = Guid.Parse("5e248637-34e2-4826-8e2e-e8a7453e08cc"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("ba876cc6-c721-4606-9ec6-ef62e1ee33be"),
                DateFromPlan = new DateTime(638198784000000000),
                SeamId = Guid.Parse("c07e6c99-6ab0-4e57-8ea3-53bb68ffa507"),
                ProductAccountId = Guid.Parse("5e248637-34e2-4826-8e2e-e8a7453e08cc"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("e08e99f0-8feb-4041-8034-b3927df2d614"),
                DateFromPlan = new DateTime(638198784000000000),
                SeamId = Guid.Parse("3e55080c-fc22-4c5a-ac4e-a0dc4cbb67e1"),
                ProductAccountId = Guid.Parse("05eaeb08-5379-4423-8e87-47d9665baa06"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("ebc78c1f-aa01-4de9-b300-24b91f13924d"),
                DateFromPlan = new DateTime(638198784000000000),
                SeamId = Guid.Parse("1b6a85ad-6da0-4269-a86f-180ec363cb9e"),
                ProductAccountId = Guid.Parse("58e91017-c773-4e5f-a390-ed9939082e16"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("f0bb0b3e-e4a9-4db3-a42e-f8878e37a450"),
                DateFromPlan = new DateTime(638198784000000000),
                SeamId = Guid.Parse("dfbf3824-def3-485b-b5af-66c0fcd1adca"),
                ProductAccountId = Guid.Parse("05eaeb08-5379-4423-8e87-47d9665baa06"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("f5922f81-a092-4654-9be2-959d25e3ea71"),
                DateFromPlan = new DateTime(638198784000000000),
                SeamId = Guid.Parse("7d83ba4e-5b00-4935-baf1-df3ad86b15c8"),
                ProductAccountId = Guid.Parse("863d790c-81d2-4430-8819-15e4b9f2facb"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("028bc8eb-381b-4874-b644-54a7c0c82644"),
                DateFromPlan = new DateTime(638199648000000000),
                SeamId = Guid.Parse("b275eb65-ca76-4272-9662-d9b92e109177"),
                ProductAccountId = Guid.Parse("dc5d6437-75c6-4212-991c-3b09b27a5f60"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("0c5b8a87-4acd-4f02-b2dc-5fa89d347459"),
                DateFromPlan = new DateTime(638199648000000000),
                SeamId = Guid.Parse("3e55080c-fc22-4c5a-ac4e-a0dc4cbb67e1"),
                ProductAccountId = Guid.Parse("0ea53d6a-20c0-4a27-838a-1785a880ea4a"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("2abdbaac-932c-4f92-8362-11cfaa23edd4"),
                DateFromPlan = new DateTime(638199648000000000),
                SeamId = Guid.Parse("c07e6c99-6ab0-4e57-8ea3-53bb68ffa507"),
                ProductAccountId = Guid.Parse("bbfab248-90b6-4e45-b173-6a66676012ed"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("2b26d3b6-d99c-4168-9f87-e5d8d1b745f6"),
                DateFromPlan = new DateTime(638199648000000000),
                SeamId = Guid.Parse("6eb38dfc-df1a-42c4-8b12-f9956cad632e"),
                ProductAccountId = Guid.Parse("bbfab248-90b6-4e45-b173-6a66676012ed"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("2da97ac5-2b00-4366-a8c6-7a5c1566f7d0"),
                DateFromPlan = new DateTime(638199648000000000),
                SeamId = Guid.Parse("b7703aeb-535a-4be2-a171-b71fbe3cec42"),
                ProductAccountId = Guid.Parse("31f096e0-3c26-45d9-bd9e-6db50dbecbf9"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("42fab155-4aa9-4f7c-a523-f9b63aa6068f"),
                DateFromPlan = new DateTime(638199648000000000),
                SeamId = Guid.Parse("f43dc5cf-191d-4ba5-ab5f-5865f73589e0"),
                ProductAccountId = Guid.Parse("31f096e0-3c26-45d9-bd9e-6db50dbecbf9"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("466740f5-ef04-4304-aee0-386785922899"),
                DateFromPlan = new DateTime(638199648000000000),
                SeamId = Guid.Parse("3af46b20-224a-4f72-97b6-5297d2b75bf5"),
                ProductAccountId = Guid.Parse("dc5d6437-75c6-4212-991c-3b09b27a5f60"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("5d36da69-0aca-4a1b-bb34-a06a231b3f6f"),
                DateFromPlan = new DateTime(638199648000000000),
                SeamId = Guid.Parse("a3b759d7-555a-41ea-93bf-2d9c7ce48371"),
                ProductAccountId = Guid.Parse("31f096e0-3c26-45d9-bd9e-6db50dbecbf9"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("6033556d-955d-4c20-a869-4811bc5429b7"),
                DateFromPlan = new DateTime(638199648000000000),
                SeamId = Guid.Parse("03876726-8de8-486d-a01b-50b644cc76f1"),
                ProductAccountId = Guid.Parse("dc5d6437-75c6-4212-991c-3b09b27a5f60"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("8b1c1c7d-312f-4e23-99e4-2bed26ac905a"),
                DateFromPlan = new DateTime(638199648000000000),
                SeamId = Guid.Parse("b04049d0-5026-4014-bd26-e61dbd0bda14"),
                ProductAccountId = Guid.Parse("dc5d6437-75c6-4212-991c-3b09b27a5f60"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("953c92b8-5754-4e11-b387-31efc9787950"),
                DateFromPlan = new DateTime(638199648000000000),
                SeamId = Guid.Parse("ace294ec-b133-4fcb-aca8-7bdefef745f1"),
                ProductAccountId = Guid.Parse("dc5d6437-75c6-4212-991c-3b09b27a5f60"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("a665cb09-4c3b-4a6a-aae4-e0d94e82bc0e"),
                DateFromPlan = new DateTime(638199648000000000),
                SeamId = Guid.Parse("05d627b6-e193-4251-88b9-635cba1b9370"),
                ProductAccountId = Guid.Parse("31f096e0-3c26-45d9-bd9e-6db50dbecbf9"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("cdb19fc4-4d81-4118-948d-ad5cd70d02f8"),
                DateFromPlan = new DateTime(638199648000000000),
                SeamId = Guid.Parse("dc631901-db09-4add-9e04-3e5e006c2271"),
                ProductAccountId = Guid.Parse("bbfab248-90b6-4e45-b173-6a66676012ed"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("deba9e69-47ae-48e2-8e40-2656e210f2d3"),
                DateFromPlan = new DateTime(638199648000000000),
                SeamId = Guid.Parse("1b6a85ad-6da0-4269-a86f-180ec363cb9e"),
                ProductAccountId = Guid.Parse("31f096e0-3c26-45d9-bd9e-6db50dbecbf9"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("e873da1d-b22c-46d2-99c1-d8ab66afe94d"),
                DateFromPlan = new DateTime(638199648000000000),
                SeamId = Guid.Parse("c4309e97-a1e8-49de-b124-c1aa1e89de8a"),
                ProductAccountId = Guid.Parse("0ea53d6a-20c0-4a27-838a-1785a880ea4a"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("f77835a2-1cc5-40f4-923f-37b2ea6b19ad"),
                DateFromPlan = new DateTime(638199648000000000),
                SeamId = Guid.Parse("7d83ba4e-5b00-4935-baf1-df3ad86b15c8"),
                ProductAccountId = Guid.Parse("dc5d6437-75c6-4212-991c-3b09b27a5f60"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("f81a1dc2-5a88-4ce6-8d78-1d498ce17540"),
                DateFromPlan = new DateTime(638199648000000000),
                SeamId = Guid.Parse("d8955c29-4257-4705-afc3-552316d0e8bf"),
                ProductAccountId = Guid.Parse("31f096e0-3c26-45d9-bd9e-6db50dbecbf9"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("fad8a24c-257e-4f45-a42a-c3c504115c4f"),
                DateFromPlan = new DateTime(638199648000000000),
                SeamId = Guid.Parse("dfbf3824-def3-485b-b5af-66c0fcd1adca"),
                ProductAccountId = Guid.Parse("0ea53d6a-20c0-4a27-838a-1785a880ea4a"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("00cb83c3-83f6-410e-8155-bf41003488a6"),
                DateFromPlan = new DateTime(638200512000000000),
                SeamId = Guid.Parse("ace294ec-b133-4fcb-aca8-7bdefef745f1"),
                ProductAccountId = Guid.Parse("683062ca-5546-483f-8342-37aa4ea7a5ef"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("0dda6661-909b-44da-8f91-e38864826211"),
                DateFromPlan = new DateTime(638200512000000000),
                SeamId = Guid.Parse("3af46b20-224a-4f72-97b6-5297d2b75bf5"),
                ProductAccountId = Guid.Parse("683062ca-5546-483f-8342-37aa4ea7a5ef"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("1b4d0123-0798-4032-bc8f-35f6f7fc5695"),
                DateFromPlan = new DateTime(638200512000000000),
                SeamId = Guid.Parse("b7703aeb-535a-4be2-a171-b71fbe3cec42"),
                ProductAccountId = Guid.Parse("8e9259b2-578d-45af-907d-05af92293dd4"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("75ae6cec-349c-416a-964b-a00db785ce66"),
                DateFromPlan = new DateTime(638200512000000000),
                SeamId = Guid.Parse("b04049d0-5026-4014-bd26-e61dbd0bda14"),
                ProductAccountId = Guid.Parse("683062ca-5546-483f-8342-37aa4ea7a5ef"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("8ce1ea61-9b28-4106-b88c-ef858cbac8a4"),
                DateFromPlan = new DateTime(638200512000000000),
                SeamId = Guid.Parse("dc631901-db09-4add-9e04-3e5e006c2271"),
                ProductAccountId = Guid.Parse("2da8cdfa-7ffd-4ec2-aee3-07975b8a4b6c"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("94d371f5-8465-40de-94db-c7171c6c7f5e"),
                DateFromPlan = new DateTime(638200512000000000),
                SeamId = Guid.Parse("b275eb65-ca76-4272-9662-d9b92e109177"),
                ProductAccountId = Guid.Parse("683062ca-5546-483f-8342-37aa4ea7a5ef"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("9cbbd6d9-ce5b-4d3c-854c-1a08b5d504a4"),
                DateFromPlan = new DateTime(638200512000000000),
                SeamId = Guid.Parse("6eb38dfc-df1a-42c4-8b12-f9956cad632e"),
                ProductAccountId = Guid.Parse("2da8cdfa-7ffd-4ec2-aee3-07975b8a4b6c"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("acdd88d3-7d58-4bd3-9a20-96333b0a21ac"),
                DateFromPlan = new DateTime(638200512000000000),
                SeamId = Guid.Parse("3e55080c-fc22-4c5a-ac4e-a0dc4cbb67e1"),
                ProductAccountId = Guid.Parse("2fa270ee-d4db-429c-af67-98b1538a46dd"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("b6474d85-7846-42e0-abfd-0db793bf2e98"),
                DateFromPlan = new DateTime(638200512000000000),
                SeamId = Guid.Parse("c4309e97-a1e8-49de-b124-c1aa1e89de8a"),
                ProductAccountId = Guid.Parse("2fa270ee-d4db-429c-af67-98b1538a46dd"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("bb4351b2-365a-4a75-b696-564a8d8d2d2a"),
                DateFromPlan = new DateTime(638200512000000000),
                SeamId = Guid.Parse("1b6a85ad-6da0-4269-a86f-180ec363cb9e"),
                ProductAccountId = Guid.Parse("8e9259b2-578d-45af-907d-05af92293dd4"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("beef8eb5-c616-4c33-bc0f-f5359d73d6dd"),
                DateFromPlan = new DateTime(638200512000000000),
                SeamId = Guid.Parse("7d83ba4e-5b00-4935-baf1-df3ad86b15c8"),
                ProductAccountId = Guid.Parse("683062ca-5546-483f-8342-37aa4ea7a5ef"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("c21e1ee0-08d3-4659-bb29-c44420d75f75"),
                DateFromPlan = new DateTime(638200512000000000),
                SeamId = Guid.Parse("05d627b6-e193-4251-88b9-635cba1b9370"),
                ProductAccountId = Guid.Parse("8e9259b2-578d-45af-907d-05af92293dd4"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("c8b079e1-d872-4c92-b8fd-6546a7f8a0e1"),
                DateFromPlan = new DateTime(638200512000000000),
                SeamId = Guid.Parse("f43dc5cf-191d-4ba5-ab5f-5865f73589e0"),
                ProductAccountId = Guid.Parse("8e9259b2-578d-45af-907d-05af92293dd4"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("d2015664-befe-4b70-b622-46df1a994108"),
                DateFromPlan = new DateTime(638200512000000000),
                SeamId = Guid.Parse("03876726-8de8-486d-a01b-50b644cc76f1"),
                ProductAccountId = Guid.Parse("683062ca-5546-483f-8342-37aa4ea7a5ef"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("d953a03c-5ef9-4a86-af45-1ee6ae635549"),
                DateFromPlan = new DateTime(638200512000000000),
                SeamId = Guid.Parse("c07e6c99-6ab0-4e57-8ea3-53bb68ffa507"),
                ProductAccountId = Guid.Parse("2da8cdfa-7ffd-4ec2-aee3-07975b8a4b6c"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("e2a4b9c5-fa4f-440b-94b0-53b6bb72f6ce"),
                DateFromPlan = new DateTime(638200512000000000),
                SeamId = Guid.Parse("dfbf3824-def3-485b-b5af-66c0fcd1adca"),
                ProductAccountId = Guid.Parse("2fa270ee-d4db-429c-af67-98b1538a46dd"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("e5224af5-efd6-4c9c-85dd-ac627b03065e"),
                DateFromPlan = new DateTime(638200512000000000),
                SeamId = Guid.Parse("d8955c29-4257-4705-afc3-552316d0e8bf"),
                ProductAccountId = Guid.Parse("8e9259b2-578d-45af-907d-05af92293dd4"),
            },
            new SeamAccount
            {
                Id = Guid.Parse("f9eaf1fa-4c8e-41a9-833a-d4a4f3e0d1bf"),
                DateFromPlan = new DateTime(638200512000000000),
                SeamId = Guid.Parse("a3b759d7-555a-41ea-93bf-2d9c7ce48371"),
                ProductAccountId = Guid.Parse("8e9259b2-578d-45af-907d-05af92293dd4"),
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
                Id = Guid.Parse("01728f11-55e9-419b-9eca-aa431c251c72"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("97c39db1-23a3-43bb-87a0-ab4fde96797b"),
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
                Id = Guid.Parse("02fcb317-14de-41da-9a34-c5fe7e2b7f50"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("398fcdf3-d382-4ba3-92ab-395b3135ccf1"),
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
                Id = Guid.Parse("03d7ca2a-5f54-4392-a51b-9042f7af4899"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("ee7b9c7f-1df5-45d4-ae67-cf9e5d0a6ce5"),
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
                Id = Guid.Parse("04b1d572-f793-4ec4-84ee-662fecadb4fd"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("4f47479e-4b0c-406c-b76d-a5d149d53083"),
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
                Id = Guid.Parse("05745ca3-37ab-43cb-a199-7bd92c0aff0e"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("de386b8e-4b04-4d4a-bf53-20099e645aa9"),
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
                Id = Guid.Parse("071bb71c-05b3-4e54-b5f6-d5e95fa5859b"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("674b652d-2065-48b7-bf89-aacc430ea1db"),
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
                Id = Guid.Parse("09174c77-40fd-467b-83d4-4e8e4f966525"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("cfba41ce-06a4-4877-9f66-d17efc17c1c1"),
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
                Id = Guid.Parse("0a807acd-dbc3-4f06-a738-12e519c11e2c"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("f3824d86-0cc6-417e-9db8-100b736c56bb"),
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
                Id = Guid.Parse("0b087319-87ab-4384-9819-2d296f72d8b9"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("8f48b662-76ae-4d35-9d6e-05eaf954e83d"),
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
                Id = Guid.Parse("0bcc1dab-f2c5-4a96-8c8e-4f9a2e509bc9"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("674b652d-2065-48b7-bf89-aacc430ea1db"),
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
                Id = Guid.Parse("0d14e490-cd44-4a4c-bfcf-39ef8848f4e4"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("e9b5c1b8-a581-4d79-bca7-42f54efa2714"),
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
                Id = Guid.Parse("0deb5ada-5de1-4335-8a34-b04ff522019c"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("91edd7a5-5447-4040-adc4-127a6b553075"),
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
                Id = Guid.Parse("0fd3abad-75d0-478b-853a-50d68bd9a995"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("e1ad50e6-3cce-498a-9c30-a125df2783ae"),
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
                Id = Guid.Parse("1164b7c5-f467-4024-8089-635b1b033984"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("bf9c2b23-4540-4fc4-8e3b-61c18bfdecae"),
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
                Id = Guid.Parse("12177a0d-be91-4d4b-b6b5-145398bb91f6"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("48f3abc9-fa36-48a7-a97c-6f6ddf6ed689"),
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
                Id = Guid.Parse("1339d662-eaba-48e7-882d-9bba0ce3086d"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("48f3abc9-fa36-48a7-a97c-6f6ddf6ed689"),
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
                Id = Guid.Parse("14b01dbf-7c03-40f0-93b0-ee30f3d75439"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("6b1e2b36-2ceb-4460-af6c-fb93186d12d4"),
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
                Id = Guid.Parse("16b02cab-e543-4399-a630-48e218cf70c3"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("8496be09-574c-4735-a0c4-69a0466c3a03"),
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
                Id = Guid.Parse("16e4d71a-c70b-4db6-bce8-c0f1583e5b5a"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("55e90118-e490-4e3c-90cc-38c85926aeb4"),
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
                Id = Guid.Parse("17a3fdb7-e849-4ba3-b05d-5114b50ce5f4"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("5c33fcfe-c6eb-4be9-9a7e-831e417d3281"),
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
                Id = Guid.Parse("18b2f74b-f0d0-48e5-99d1-cec6ad5a2295"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("27c80ed7-bf6f-4a6a-a1d8-9728a3aecfce"),
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
                Id = Guid.Parse("1b5fae3b-caf4-4299-8097-3ab9028e9fb8"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("b2bd3679-74a4-4bf3-9b1f-42526f9871e5"),
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
                Id = Guid.Parse("1d074901-9528-432d-85b2-5ec9d7bb1d6f"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("151ba506-323c-492f-8bc7-792c1a3a3261"),
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
                Id = Guid.Parse("1e10c12d-0e3a-48d4-9d38-046676121236"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("29c11d8b-d2be-42a0-a4cd-238fd3ccc604"),
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
                Id = Guid.Parse("1e629274-6486-40dc-9d76-fc527117983d"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("b76c4260-0d58-4376-b624-1a8a0bf017aa"),
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
                Id = Guid.Parse("1f721663-22b1-490b-9ae6-cc6c23b05d0f"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("f29418ab-5a27-47de-bea9-629e410ab4d1"),
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
                Id = Guid.Parse("20d34612-b9f6-4c67-9507-c5143b28fcdd"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("a4c0bc87-26fd-45fe-a135-1169702387c0"),
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
                Id = Guid.Parse("2291f58b-b6b7-40bf-aa74-3b635e9c7b3c"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("acae688f-3fc8-47e7-8396-5dfaa74ae6b3"),
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
                Id = Guid.Parse("232f690b-3951-4ef8-8c25-80f95f49845f"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("79ae86eb-f645-4b4b-9694-818f53de97e8"),
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
                Id = Guid.Parse("23771ae3-3ab7-4754-bc30-9476071e92ae"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("3f9e0cbe-4b89-42bf-923f-89526cbd682f"),
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
                Id = Guid.Parse("24369cfd-2414-4c2b-97e6-b909a66ea1ae"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("74c58713-2bec-4d4c-9887-2f4a6ffbb8dc"),
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
                Id = Guid.Parse("27c37dbe-1650-4e25-a9a3-a83c81b790cd"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("2a003b51-f5ea-4647-826d-c4874ffd0376"),
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
                Id = Guid.Parse("288a7ff6-535d-45dc-9eee-be03bab910ab"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("f19ab689-f835-485f-af67-d41efa10f651"),
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
                Id = Guid.Parse("29f03a7f-76ae-4dfb-87fd-3257be80bd1c"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("f63125c1-acf5-4aaf-b553-516f331b8e32"),
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
                Id = Guid.Parse("2a2b13d0-442b-4fc9-ad83-bff931d73cfc"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("e1d7a081-fb5f-4a31-bc67-708375c6bf7f"),
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
                Id = Guid.Parse("2e51c3a9-a8a7-457e-9f22-ab28317db6da"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("f3824d86-0cc6-417e-9db8-100b736c56bb"),
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
                Id = Guid.Parse("2f1df606-d1fe-4fae-9b8c-49569c523b29"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("86edd6d6-5fd3-40a9-81f1-dbfe1b36aa50"),
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
                Id = Guid.Parse("31e20825-b475-4900-9005-4909800f7670"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("fb19a111-0bdf-474f-8d1d-8dcc3c7fc078"),
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
                Id = Guid.Parse("33f3f8cb-22c9-4f2d-ab97-adb8b6adac26"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("0dfe2399-755a-4beb-b686-40214d966dd6"),
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
                Id = Guid.Parse("34b6652b-8da8-419b-8493-5705064987d4"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("a57e6340-096c-4afa-a362-568ec2782600"),
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
                Id = Guid.Parse("350a3c13-bb71-4abd-95ae-664dcd51c350"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("71bf9c1d-5d26-41ef-9b92-33a9132c7b58"),
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
                Id = Guid.Parse("361c4106-3e6e-4924-9c9a-5188668920e6"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("2ac04518-7a7e-4e36-b680-ee817d1eaa86"),
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
                Id = Guid.Parse("367cbf68-9606-4b05-ad8e-fb4e9884bacd"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("051a19c3-5628-4d43-b39a-4ad717946f5a"),
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
                Id = Guid.Parse("36e8f2b2-fd41-4b0a-8810-07b2f18a855f"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("a8058edc-ada6-411d-8cf5-a5888f033de4"),
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
                Id = Guid.Parse("38f8ef0e-5035-4033-9a55-66d3edc2d8ae"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("ee7b9c7f-1df5-45d4-ae67-cf9e5d0a6ce5"),
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
                Id = Guid.Parse("3cc2453c-02d1-45d3-9fc2-ed1e9e2c62ca"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("ba63db71-0bb5-433a-98dc-8165cecf78ad"),
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
                Id = Guid.Parse("3ec670e8-3080-41e6-82f2-a48bbb342377"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("2a003b51-f5ea-4647-826d-c4874ffd0376"),
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
                Id = Guid.Parse("40afa6a3-ed76-41f1-aeab-fa9221fa3e78"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("f041bce5-7e21-482b-a31a-40f30ddc5687"),
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
                Id = Guid.Parse("40c840ad-9a1c-4040-97ad-525d020b6f80"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("5773e326-ab06-44c7-bc38-3763fecdabbe"),
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
                Id = Guid.Parse("43eeab06-8fe2-450c-9593-c2a3ba487a43"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("ff1d28a6-7900-4218-92d4-dab56392fc1a"),
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
                Id = Guid.Parse("453ce62a-e6bd-40b0-b060-e54c5dff2f85"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("bf9c2b23-4540-4fc4-8e3b-61c18bfdecae"),
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
                Id = Guid.Parse("48c7b411-e5a7-4ab6-991e-12d962476290"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("5c33fcfe-c6eb-4be9-9a7e-831e417d3281"),
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
                Id = Guid.Parse("4a4a9510-5922-4496-a60b-a5687f8e0c61"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("76d0a222-ba01-464d-ac10-d0b0e1443116"),
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
                Id = Guid.Parse("4cd42a76-e62c-4945-8712-9648fc59d60d"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("2ac04518-7a7e-4e36-b680-ee817d1eaa86"),
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
                Id = Guid.Parse("5015ce96-0511-4b7e-b44e-0acfa1e7f0f4"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("a57e6340-096c-4afa-a362-568ec2782600"),
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
                Id = Guid.Parse("51354470-e905-408d-901a-6326fa2ea533"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("815ea51d-c562-4deb-a3e6-c41b8973e16c"),
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
                Id = Guid.Parse("53311bcb-1458-4e3f-a7d9-160de8ee6704"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("4db44c6a-636a-49be-9669-e8d244263829"),
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
                Id = Guid.Parse("5619003b-2542-4e33-a1b4-ab66d020982f"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("65578bcb-df3f-4641-ac75-d342cc933107"),
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
                Id = Guid.Parse("5677935a-d124-4056-8043-8df943529c1b"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("af93c5e6-f8c3-44b1-acbd-119d1b90bc65"),
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
                Id = Guid.Parse("58b96bd4-6eda-4719-aadb-0377c82137a6"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("091df164-48ab-4961-a22b-1d872a61daac"),
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
                Id = Guid.Parse("5b9ee8b8-7c90-467a-9fe0-b2147517d989"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("f19ab689-f835-485f-af67-d41efa10f651"),
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
                Id = Guid.Parse("5d43a233-c0a7-47c6-8c37-a34387c46917"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("2dc99950-6c7c-4ab0-9e02-f17a6fd935e6"),
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
                Id = Guid.Parse("5e01aa4e-eb98-480b-8a3a-b124f1d69a5e"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("6b1e2b36-2ceb-4460-af6c-fb93186d12d4"),
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
                Id = Guid.Parse("5ea19351-22cf-4c83-b223-2d7740719be9"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("da264e77-8bb1-4ca1-aedc-439232d050a6"),
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
                Id = Guid.Parse("5f67c1bf-8875-4627-bb6b-786906df9b0c"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("4f47479e-4b0c-406c-b76d-a5d149d53083"),
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
                Id = Guid.Parse("61fc3510-0c06-4b3b-a775-d235c47a7245"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("ba63db71-0bb5-433a-98dc-8165cecf78ad"),
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
                Id = Guid.Parse("6306a9a5-0263-49aa-ad6e-4bb074d43ab6"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("1bfa9837-467e-442d-98bd-9222db9152f9"),
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
                Id = Guid.Parse("63997135-324b-4727-811a-dcc13e56de20"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("fb19a111-0bdf-474f-8d1d-8dcc3c7fc078"),
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
                Id = Guid.Parse("63a3223b-35eb-4d1b-86cc-a1758471c40f"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("8b0f2eb4-19fa-4449-b79d-e1649e67322a"),
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
                Id = Guid.Parse("67ad03f6-eb2d-44bf-b01b-7564f643d8e7"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("151ba506-323c-492f-8bc7-792c1a3a3261"),
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
                Id = Guid.Parse("6850f1ba-2024-4842-97b6-1a5226a6ca11"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("54ff147e-247d-44b4-9dff-d854474ccd4a"),
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
                Id = Guid.Parse("6a25d359-35f7-4edd-beff-7620a3d99015"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("0d7a8abe-5a68-4be0-a99d-63e2223e6d1f"),
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
                Id = Guid.Parse("6aeaf2f9-9e1f-43a5-a181-12438889452a"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("58e244c2-a55f-4c69-90b6-163adfde277b"),
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
                Id = Guid.Parse("6b33978f-9eca-4d45-85fd-1a4cc3a8895a"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("f3824d86-0cc6-417e-9db8-100b736c56bb"),
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
                Id = Guid.Parse("6c577f92-c2d7-4d23-88cf-b89aa837143b"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
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
                Id = Guid.Parse("6d4e9cdb-9445-4851-a61f-aeba035d29e8"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("815ea51d-c562-4deb-a3e6-c41b8973e16c"),
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
                Id = Guid.Parse("6ed63a6e-73c8-4d2a-99a7-8def1924dac7"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("6549760a-d9fb-4ea6-9efe-761552343255"),
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
                Id = Guid.Parse("6fd1ec4a-90fc-4fee-a0c7-bd8c06e67084"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("ef50323e-c4e5-463c-b10e-1cdd821ba51d"),
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
                Id = Guid.Parse("7090164d-82f5-44df-8429-4b981f3a060f"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("091df164-48ab-4961-a22b-1d872a61daac"),
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
                Id = Guid.Parse("732db908-79d5-4c23-9bd9-adefb9b6ba28"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("8fba9a40-909c-4268-82a7-1913a1adfc21"),
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
                Id = Guid.Parse("7514bed3-003b-4374-a541-241b68cf24d7"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("e75725ce-9c6d-46cd-ae16-a86d4b822972"),
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
                Id = Guid.Parse("7760753a-2d0c-4997-90e7-9b88a49c0555"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("ece10748-bd4d-4a24-8cd1-c3fe8e9679ed"),
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
                Id = Guid.Parse("789d7872-6c29-41f3-a48f-a0d16ac15ab3"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("97c39db1-23a3-43bb-87a0-ab4fde96797b"),
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
                Id = Guid.Parse("7a3e054c-8cde-469e-86d3-a290309ec61c"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("8fa8094e-1d6a-46e9-a2a0-5145407d2870"),
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
                Id = Guid.Parse("7afbfb64-6b17-423a-8a97-f446cdbabd1c"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("0bf54632-e454-4249-a9d8-20214a2a2717"),
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
                Id = Guid.Parse("7bb4d993-4930-432c-95f4-9dc2133288ba"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("f63125c1-acf5-4aaf-b553-516f331b8e32"),
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
                Id = Guid.Parse("7e83e722-3ef3-4a7e-a6e6-8d0c0bda9168"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("5f69f15e-3071-4b0e-9db8-9f1ac8df2884"),
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
                Id = Guid.Parse("7fd26d80-83c6-4458-a251-9193370ecf33"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("1d660994-f74f-413b-9647-c21e15531079"),
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
                Id = Guid.Parse("80e9c9d9-7f33-4078-b51c-67738ca21979"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("dd3982b0-f157-449d-af7f-f5cc9cd829d7"),
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
                Id = Guid.Parse("8170bb85-b9ec-47a7-99b9-d50d597ca2e0"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("3ac363fb-d192-485a-aa60-33b73951193a"),
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
                Id = Guid.Parse("8250ac0f-6398-493e-9225-e676da5e2964"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("6b1e2b36-2ceb-4460-af6c-fb93186d12d4"),
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
                Id = Guid.Parse("8389c4ab-2f63-4b70-aa63-96841cb89e0f"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("cbd7b07d-08af-4f95-bf87-6456a7a134cf"),
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
                Id = Guid.Parse("8441341d-89b5-4baa-bd8a-8c8a0d83c099"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("79ae86eb-f645-4b4b-9694-818f53de97e8"),
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
                Id = Guid.Parse("85c38dec-2e31-49b5-ad39-5c2b7af25848"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("e1d7a081-fb5f-4a31-bc67-708375c6bf7f"),
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
                Id = Guid.Parse("8668e708-8d99-461d-8fc4-04342c1a73b8"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("3e7c2f83-0fd0-4d2c-aa9e-442a68e924a0"),
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
                Id = Guid.Parse("877afd2f-22a3-405f-822a-60a49cabfcbb"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("853fd777-78b5-49ef-baee-12025f00b4c3"),
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
                Id = Guid.Parse("88882ba9-06ab-4110-b608-a7fefcd9a715"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("a4c0bc87-26fd-45fe-a135-1169702387c0"),
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
                Id = Guid.Parse("88bf2882-ded8-4b7f-a3b4-deb9076bee9e"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("aa96fe2f-d9e8-4e3e-bef3-6744554d45ad"),
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
                Id = Guid.Parse("89e1d948-2c4c-4e93-9b23-dd347db5943e"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("eabee1fe-082a-4e6f-afaf-e84918777617"),
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
                Id = Guid.Parse("8ac51536-2df4-4121-abae-3ec608b51897"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("dd3982b0-f157-449d-af7f-f5cc9cd829d7"),
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
                Id = Guid.Parse("8bacbe04-855d-44e5-a8f6-3a7e936d4bdf"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("ff1d28a6-7900-4218-92d4-dab56392fc1a"),
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
                Id = Guid.Parse("8c64b2cc-48cf-4b5e-96ba-3b58f9877095"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("0d6ddde9-3469-4c4a-8dc3-74c3e07cb9b6"),
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
                Id = Guid.Parse("8d1eb30b-bc00-4970-8795-a097144032e1"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("edee3016-a2ae-4356-a6d5-d0d60cb2674d"),
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
                Id = Guid.Parse("8df0b541-0219-4b2e-8a0d-51cedef5ff7e"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("bd94c72e-730c-42a2-a8c4-b33937d189a7"),
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
                Id = Guid.Parse("902ff03d-6f4f-4f28-8cac-5b9253e3eaad"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("ef2c7559-5207-422b-b597-9512072b5321"),
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
                Id = Guid.Parse("92024960-1a7a-4302-bf8e-6ec4317a6ba8"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("ea2dbfaf-a88b-4646-9444-f29592c84871"),
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
                Id = Guid.Parse("9445348b-722d-45dd-bbad-2ba20081985d"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("8b0f2eb4-19fa-4449-b79d-e1649e67322a"),
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
                Id = Guid.Parse("95f92ca2-f9f8-4680-84bf-cdb78fc60783"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("da264e77-8bb1-4ca1-aedc-439232d050a6"),
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
                Id = Guid.Parse("96dcac81-924e-4aba-ad9c-aeb7884f3597"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("7f92d503-300d-42f7-99aa-092c1d36d969"),
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
                Id = Guid.Parse("97a3b3a3-75b4-467c-97af-acea8b628528"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("79136e84-eb07-4594-b806-38f627cf295c"),
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
                Id = Guid.Parse("995e820f-22a3-4e1d-92f5-cdcfd9f5820d"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("68511386-69a6-4feb-ab7d-279c52044b9c"),
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
                Id = Guid.Parse("9ab3b2b9-1a9c-413a-a09a-bad1957e2d6b"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("74c58713-2bec-4d4c-9887-2f4a6ffbb8dc"),
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
                Id = Guid.Parse("9b144a6d-a385-46ac-83f1-4200d0864080"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("70e49a41-7c35-496d-b60b-291450133659"),
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
                Id = Guid.Parse("9d22e3d3-e394-4196-8031-b20cf50c5d55"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("d9ecbd82-d9f6-41df-8ebd-ee3b36b0afe1"),
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
                Id = Guid.Parse("9d709897-feb2-4cdc-b4e4-aec5d5f7d76d"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("eee79665-3549-4720-92dd-2b2d8c91810b"),
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
                Id = Guid.Parse("9e20b46d-dd4d-4f27-ac3b-b07b9238180f"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("0bf54632-e454-4249-a9d8-20214a2a2717"),
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
                Id = Guid.Parse("a07ca01f-b4eb-428b-825d-73e653c9b994"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("dd3982b0-f157-449d-af7f-f5cc9cd829d7"),
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
                Id = Guid.Parse("a11e882f-f190-4585-b2da-1aca7e53f00f"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("0bf54632-e454-4249-a9d8-20214a2a2717"),
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
                Id = Guid.Parse("a477c6d9-f059-4ab6-aa28-71d9e31ef111"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("ef2c7559-5207-422b-b597-9512072b5321"),
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
                Id = Guid.Parse("a4cdc319-e28e-4c3b-9e6d-68bf7c5f1fde"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("74c58713-2bec-4d4c-9887-2f4a6ffbb8dc"),
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
                Id = Guid.Parse("a5a01d66-ae59-4c0d-815b-c45d143c9401"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("e743a948-677b-4b19-a77a-1bf8bd13ac27"),
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
                Id = Guid.Parse("a5bd107d-97ed-40b2-9b92-e4a87a313fb8"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("f29418ab-5a27-47de-bea9-629e410ab4d1"),
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
                Id = Guid.Parse("aa4bce43-f427-4549-82d0-7981ed75ecc4"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("43517b65-b3ec-492f-801d-cff9b4a52b93"),
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
                Id = Guid.Parse("aacc1040-4bb0-42bc-b604-e681c8feb9d7"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("af93c5e6-f8c3-44b1-acbd-119d1b90bc65"),
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
                Id = Guid.Parse("abf2e501-9968-4cef-a5f0-675b8a804140"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("54ff147e-247d-44b4-9dff-d854474ccd4a"),
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
                Id = Guid.Parse("ac669c94-7d3f-42bb-8902-85380f53e97b"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("a3ec12f4-0cb9-4fab-9dba-ddeb90011ae6"),
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
                Id = Guid.Parse("adf76d0e-54a3-48c5-9e19-7fc48531f74f"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("6549760a-d9fb-4ea6-9efe-761552343255"),
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
                Id = Guid.Parse("ae7f0185-8f17-4986-b767-5dbce5440007"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("a8058edc-ada6-411d-8cf5-a5888f033de4"),
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
                Id = Guid.Parse("aec03bc2-b1c9-4f5a-98e8-146efb0dc42f"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("f357d00e-f14d-4b9c-8f5c-e0e8235e2648"),
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
                Id = Guid.Parse("af709154-0d5a-465e-b5a0-36ed336e249c"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("43517b65-b3ec-492f-801d-cff9b4a52b93"),
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
                Id = Guid.Parse("b25940cd-7b3b-4d4e-8800-6ee9c1542116"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("abbe7f4d-d427-4428-91b3-3cff32760fec"),
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
                Id = Guid.Parse("b36309fe-798c-4767-bb60-10c895788974"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("76d0a222-ba01-464d-ac10-d0b0e1443116"),
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
                Id = Guid.Parse("b4c2a187-8048-47ad-8cad-6f2dbc00712b"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("77f692ec-1e8d-4dfc-b25c-b4c66fc59404"),
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
                Id = Guid.Parse("b8d88324-3a9a-4ed2-b335-8d585b808de9"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("680dda85-9fba-4977-851d-245d2820fcdd"),
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
                Id = Guid.Parse("bb67680d-7ed3-4dcd-96bd-c180a04e1591"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("79136e84-eb07-4594-b806-38f627cf295c"),
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
                Id = Guid.Parse("bc79dd00-946c-4d7b-9a22-ba5345c83ad7"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("b76c4260-0d58-4376-b624-1a8a0bf017aa"),
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
                Id = Guid.Parse("be52d412-c857-4553-b2d8-cce28c0a0688"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("eabee1fe-082a-4e6f-afaf-e84918777617"),
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
                Id = Guid.Parse("bf2238ca-ef98-45fb-92cf-59b127a60d95"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("3f9e0cbe-4b89-42bf-923f-89526cbd682f"),
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
                Id = Guid.Parse("c085bb22-ee69-42ff-9220-dee993087e25"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("76d0a222-ba01-464d-ac10-d0b0e1443116"),
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
                Id = Guid.Parse("c28b77c8-bb4d-417e-a7fa-9d9c4a011f60"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("b6e312dd-7e3b-42a1-9548-615c0a1cdd8b"),
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
                Id = Guid.Parse("c38c15da-af09-49cc-941f-8b104ead8818"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("7f92d503-300d-42f7-99aa-092c1d36d969"),
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
                Id = Guid.Parse("c46a57f8-2a4d-474f-8357-21fa457cf129"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("aa96fe2f-d9e8-4e3e-bef3-6744554d45ad"),
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
                Id = Guid.Parse("c68e72c0-8384-47d3-af19-2f7487b08aec"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("1a2e812f-6974-44f6-b63d-2aed7ec9ab69"),
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
                Id = Guid.Parse("c825e763-f46c-4431-96a7-9e355f5a5d98"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("572e451f-944a-46d4-91c9-c1b05645ff82"),
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
                Id = Guid.Parse("c92d6279-a231-40e1-a209-ee57e57bac11"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("f2c7a58a-a9f6-4489-94a5-7549ce07efdd"),
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
                Id = Guid.Parse("cd3eb1d8-5ea9-482c-9bf4-0ce259738ac7"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("ef50323e-c4e5-463c-b10e-1cdd821ba51d"),
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
                Id = Guid.Parse("cf1dff2a-a26c-4c41-82c4-e6ccbdc3a8f9"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("e9b5c1b8-a581-4d79-bca7-42f54efa2714"),
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
                Id = Guid.Parse("d0ed904b-e358-43d9-aba2-5c1a738eae2b"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("1bfa9837-467e-442d-98bd-9222db9152f9"),
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
                Id = Guid.Parse("d5e496b2-1830-4366-b1b9-a360bd55e1f6"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("15cc8a1f-2440-4bdd-9caf-846b3db51068"),
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
                Id = Guid.Parse("d7f59707-945a-4fa0-85d4-492964116e73"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("ba63db71-0bb5-433a-98dc-8165cecf78ad"),
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
                Id = Guid.Parse("db6c1f08-3c7a-448e-9196-4f740c359faf"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("aa96fe2f-d9e8-4e3e-bef3-6744554d45ad"),
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
                Id = Guid.Parse("dc9d6428-c42f-4d9c-8047-c515381680c9"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("54ff147e-247d-44b4-9dff-d854474ccd4a"),
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
                Id = Guid.Parse("dcf7d516-499f-4408-9278-404cbee5804d"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("de386b8e-4b04-4d4a-bf53-20099e645aa9"),
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
                Id = Guid.Parse("e0c65762-6bc3-455e-8a74-ed0020c0b7b3"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("3e7c2f83-0fd0-4d2c-aa9e-442a68e924a0"),
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
                Id = Guid.Parse("e21422bc-3f33-4a51-a711-7f13e0319374"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("edee3016-a2ae-4356-a6d5-d0d60cb2674d"),
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
                Id = Guid.Parse("e3002106-eabb-4466-877f-72c270be7e5f"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("2dc99950-6c7c-4ab0-9e02-f17a6fd935e6"),
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
                Id = Guid.Parse("e39f8df1-c232-481d-9e9a-dc9fe25e1684"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("cfba41ce-06a4-4877-9f66-d17efc17c1c1"),
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
                Id = Guid.Parse("e54e5d04-ae7c-4112-a653-1730630510fb"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("8f48b662-76ae-4d35-9d6e-05eaf954e83d"),
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
                Id = Guid.Parse("e632fd64-52a1-4e59-800e-34981154711f"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("a57e6340-096c-4afa-a362-568ec2782600"),
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
                Id = Guid.Parse("ea7d9713-4650-4f44-96ff-72122775942e"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("e1ad50e6-3cce-498a-9c30-a125df2783ae"),
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
                Id = Guid.Parse("eb4e66de-00bd-4e5b-89f9-3dcbb5952d8a"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("14143820-3069-4af7-ac0e-9d718da05df6"),
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
                Id = Guid.Parse("eb89dfa7-ae68-4233-8fce-c9348103262e"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("5f69f15e-3071-4b0e-9db8-9f1ac8df2884"),
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
                Id = Guid.Parse("ee18ba7e-2fbc-49b1-b681-a983542b2546"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("b6e312dd-7e3b-42a1-9548-615c0a1cdd8b"),
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
                Id = Guid.Parse("efe9f538-e817-4bda-90ba-07270e599bf4"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("b2bd3679-74a4-4bf3-9b1f-42526f9871e5"),
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
                Id = Guid.Parse("f2836971-5757-4d6f-aa17-a13c19d92433"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("051a19c3-5628-4d43-b39a-4ad717946f5a"),
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
                Id = Guid.Parse("f39b468c-251e-48c3-9292-40395a349341"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("c1a50c66-c72e-4cf7-9f4a-c0b540ae7b1e"),
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
                Id = Guid.Parse("f551edea-ebb0-4d59-8598-552e4143ac9a"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("b76c4260-0d58-4376-b624-1a8a0bf017aa"),
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
                Id = Guid.Parse("f769fbd0-38ec-48d7-a684-ff21dbae16ab"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("8f448239-2ab1-4276-a3f5-a605d95625e4"),
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
                Id = Guid.Parse("f81d2610-bc68-42f9-9798-2c602de51e09"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("91f6396d-95ab-44be-8889-c6c145f94bf5"),
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
                Id = Guid.Parse("f8d2fe01-c939-4e6a-8c90-48a4f4fc3fe9"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("8496be09-574c-4735-a0c4-69a0466c3a03"),
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
                Id = Guid.Parse("f92dd917-67e0-4185-b542-85d6b01a22ce"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("8b0f2eb4-19fa-4449-b79d-e1649e67322a"),
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
                Id = Guid.Parse("fd33adc2-b52d-406c-aecc-a6614c92be46"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("d9ecbd82-d9f6-41df-8ebd-ee3b36b0afe1"),
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
                Id = Guid.Parse("fef10cf8-83d7-460f-8faa-26b3a207b96f"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("f2c7a58a-a9f6-4489-94a5-7549ce07efdd"),
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
                Id = Guid.Parse("ffd7972f-a583-4b04-8c5b-cad36a810e4f"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("b82fa137-85b0-49e8-92cb-082495b9d328"),
            },
            new SeamResult
            {
                Id = Guid.Parse("14603e17-04c1-45a7-bc52-e6d015dfc1c6"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("c0a6379f-f3a4-408b-ba14-fe2d0e88a448"),
            },
            new SeamResult
            {
                Id = Guid.Parse("16008655-7706-45e9-b743-1b15aa7f241c"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("a27199e8-70e7-464c-bd20-3fdd6360b5a8"),
            },
            new SeamResult
            {
                Id = Guid.Parse("186a9134-4f7d-4948-8b56-ba3888886178"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("1dc87fa3-2f08-4601-9598-9f09e3da21d7"),
            },
            new SeamResult
            {
                Id = Guid.Parse("1b4dc30b-3dc5-4803-b524-b5bc2f5b6a98"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("b58243ac-0276-449f-9d0b-5e1344002a00"),
            },
            new SeamResult
            {
                Id = Guid.Parse("25386786-0775-4fc0-82e0-3fd4cd73391e"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("5054ae70-7845-49b1-8490-72a05f9ddf63"),
            },
            new SeamResult
            {
                Id = Guid.Parse("31f71973-5126-4326-bd02-2f664e703f2d"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("5054ae70-7845-49b1-8490-72a05f9ddf63"),
            },
            new SeamResult
            {
                Id = Guid.Parse("34f99111-99fb-467d-b7d2-3021007c34ff"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("74f96cb9-7031-4cf3-86a9-d06a0b9f304b"),
            },
            new SeamResult
            {
                Id = Guid.Parse("35816e88-4e94-4d57-a6b3-fc2db032b8e4"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("59e8a89e-122c-4f45-b480-f344736195e5"),
            },
            new SeamResult
            {
                Id = Guid.Parse("38799f86-449e-44f8-bd84-85d75b9f3ee0"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("b49e2a92-5cf1-415f-9ac1-617163e1bc09"),
            },
            new SeamResult
            {
                Id = Guid.Parse("39dcda47-0eb8-43b0-982f-9d2e228e383b"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("b58243ac-0276-449f-9d0b-5e1344002a00"),
            },
            new SeamResult
            {
                Id = Guid.Parse("4016f088-674f-41e5-885b-cdbf0665d4f6"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("f8f1776e-3052-49e4-a46f-204985183d38"),
            },
            new SeamResult
            {
                Id = Guid.Parse("44acd2be-711d-4f0c-b407-9e9165675903"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("f326cc79-f7a9-4d35-ac06-0226a0ff5149"),
            },
            new SeamResult
            {
                Id = Guid.Parse("47c0b726-b3d8-4017-a5f9-f576b004d3b4"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("1dc87fa3-2f08-4601-9598-9f09e3da21d7"),
            },
            new SeamResult
            {
                Id = Guid.Parse("49946c48-de46-495b-bc00-e696a87b2646"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("74f96cb9-7031-4cf3-86a9-d06a0b9f304b"),
            },
            new SeamResult
            {
                Id = Guid.Parse("49dc93af-2d2d-4bea-afae-8ed7b2ff29b6"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("cebf72e8-768c-4300-a232-8a753843b867"),
            },
            new SeamResult
            {
                Id = Guid.Parse("4c28653a-f238-4f66-8050-6909353c1c35"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("cebf72e8-768c-4300-a232-8a753843b867"),
            },
            new SeamResult
            {
                Id = Guid.Parse("4d814d93-a207-4f82-95b8-6cbbd52f3962"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("c0a6379f-f3a4-408b-ba14-fe2d0e88a448"),
            },
            new SeamResult
            {
                Id = Guid.Parse("541c9198-0af4-4180-9044-a84ff1cc46d6"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("5054ae70-7845-49b1-8490-72a05f9ddf63"),
            },
            new SeamResult
            {
                Id = Guid.Parse("5901c08f-3c47-432b-8697-e3fc0565b1bd"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("7a31eb37-7f82-484b-abd9-3bfc0e6761a8"),
            },
            new SeamResult
            {
                Id = Guid.Parse("5f91de8b-5199-45f1-ac92-e5144af0fc37"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("4d0a852e-d8d7-4611-a2e1-cdca2ec16c40"),
            },
            new SeamResult
            {
                Id = Guid.Parse("606e0a0d-5701-4bd2-87ad-abb37b1aa97b"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("4d0a852e-d8d7-4611-a2e1-cdca2ec16c40"),
            },
            new SeamResult
            {
                Id = Guid.Parse("6355c65b-2e1b-4876-b19b-bd6fe2027229"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("45065674-1529-4c2a-b577-bd7c01df4e1e"),
            },
            new SeamResult
            {
                Id = Guid.Parse("6a985b1d-2d50-4db7-bbe6-acaaaef4ea4f"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("cebf72e8-768c-4300-a232-8a753843b867"),
            },
            new SeamResult
            {
                Id = Guid.Parse("6c008a5e-6b18-4c9d-8b49-61ac893e5a36"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("7a31eb37-7f82-484b-abd9-3bfc0e6761a8"),
            },
            new SeamResult
            {
                Id = Guid.Parse("88100bbf-e05b-4db8-a364-e9c8c7e4dd4f"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("1dc87fa3-2f08-4601-9598-9f09e3da21d7"),
            },
            new SeamResult
            {
                Id = Guid.Parse("898eaf8f-6208-4dc1-87bb-be1e6efcbd74"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("74f96cb9-7031-4cf3-86a9-d06a0b9f304b"),
            },
            new SeamResult
            {
                Id = Guid.Parse("90e736ad-422f-498c-83ef-7b8464ffeb33"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("f326cc79-f7a9-4d35-ac06-0226a0ff5149"),
            },
            new SeamResult
            {
                Id = Guid.Parse("97cebf38-64de-4e34-8c5e-b069fce323ce"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("f8f1776e-3052-49e4-a46f-204985183d38"),
            },
            new SeamResult
            {
                Id = Guid.Parse("99428ab1-a6cf-41c0-a338-eb26f0597064"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("a27199e8-70e7-464c-bd20-3fdd6360b5a8"),
            },
            new SeamResult
            {
                Id = Guid.Parse("99c4775e-05fc-4a2e-812f-b6534da95856"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("b7cfc901-1bb5-4b4a-a282-70056517ebb3"),
            },
            new SeamResult
            {
                Id = Guid.Parse("9a37bf1a-0cd0-486a-9576-351ab9176545"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("b58243ac-0276-449f-9d0b-5e1344002a00"),
            },
            new SeamResult
            {
                Id = Guid.Parse("9a776a93-caeb-47bb-b754-8bc6fa270d1d"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("3fb2d95a-f1bf-4970-8ee8-7e89c0882c1f"),
            },
            new SeamResult
            {
                Id = Guid.Parse("a4d4f48c-6cf1-45d8-8772-e1ad62af3eed"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("af2523a2-62c4-42ce-a438-0ebfd69471d0"),
            },
            new SeamResult
            {
                Id = Guid.Parse("a83e9f55-687b-44e7-b244-52bed3fcc029"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("b7cfc901-1bb5-4b4a-a282-70056517ebb3"),
            },
            new SeamResult
            {
                Id = Guid.Parse("ab8829be-388d-47c7-9f85-439a474e3a11"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("f326cc79-f7a9-4d35-ac06-0226a0ff5149"),
            },
            new SeamResult
            {
                Id = Guid.Parse("ae0446c6-297e-4259-8a7a-ad53573324d8"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("af2523a2-62c4-42ce-a438-0ebfd69471d0"),
            },
            new SeamResult
            {
                Id = Guid.Parse("b018db61-fab8-447a-8b7e-6feb167b2552"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("7a31eb37-7f82-484b-abd9-3bfc0e6761a8"),
            },
            new SeamResult
            {
                Id = Guid.Parse("b0d1d91e-7cda-44d1-802a-8e7bbf9e70fd"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("b7cfc901-1bb5-4b4a-a282-70056517ebb3"),
            },
            new SeamResult
            {
                Id = Guid.Parse("b4a595d9-8364-4e35-86a0-e37ed7bb45f8"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("af2523a2-62c4-42ce-a438-0ebfd69471d0"),
            },
            new SeamResult
            {
                Id = Guid.Parse("b5c8ad2c-555b-4d3c-b388-3700bc840c9e"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("45065674-1529-4c2a-b577-bd7c01df4e1e"),
            },
            new SeamResult
            {
                Id = Guid.Parse("baa98458-66c9-4cc7-a5e9-d75c04738e17"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("45065674-1529-4c2a-b577-bd7c01df4e1e"),
            },
            new SeamResult
            {
                Id = Guid.Parse("c109a4d7-ba6a-4517-8d9d-0767154da313"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("59e8a89e-122c-4f45-b480-f344736195e5"),
            },
            new SeamResult
            {
                Id = Guid.Parse("cb9ed16c-939e-48c3-b43f-dde165b619d6"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("b49e2a92-5cf1-415f-9ac1-617163e1bc09"),
            },
            new SeamResult
            {
                Id = Guid.Parse("cf840af2-4ed0-424d-b22e-ce6db827e5c2"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("e3cf2a8c-aa76-4792-842c-985634c8bf67"),
            },
            new SeamResult
            {
                Id = Guid.Parse("d1a33349-b073-42e6-9a5f-73c94f4aaa72"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("f8f1776e-3052-49e4-a46f-204985183d38"),
            },
            new SeamResult
            {
                Id = Guid.Parse("d49d97b9-49f6-431a-93b4-4b61aa79609e"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("4d0a852e-d8d7-4611-a2e1-cdca2ec16c40"),
            },
            new SeamResult
            {
                Id = Guid.Parse("d5ca4b31-a0e7-44b9-9bcd-5b4430f95c2a"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("b49e2a92-5cf1-415f-9ac1-617163e1bc09"),
            },
            new SeamResult
            {
                Id = Guid.Parse("d638a7f9-9610-4eb7-807a-44d67ff15e5f"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("59e8a89e-122c-4f45-b480-f344736195e5"),
            },
            new SeamResult
            {
                Id = Guid.Parse("dcfe0527-dd15-4cbb-80b8-7caa8f1c5bfb"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("e3cf2a8c-aa76-4792-842c-985634c8bf67"),
            },
            new SeamResult
            {
                Id = Guid.Parse("e02f27b3-51c5-4daa-a399-858011376278"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("3fb2d95a-f1bf-4970-8ee8-7e89c0882c1f"),
            },
            new SeamResult
            {
                Id = Guid.Parse("e3d3e5db-8eaa-48ed-9570-a8ad8ae8105b"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("3fb2d95a-f1bf-4970-8ee8-7e89c0882c1f"),
            },
            new SeamResult
            {
                Id = Guid.Parse("e97a8d23-2ce9-476f-a7bd-6fbcec8e535d"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("e3cf2a8c-aa76-4792-842c-985634c8bf67"),
            },
            new SeamResult
            {
                Id = Guid.Parse("f39f5f55-eb94-487a-9d94-804799794cc4"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("a27199e8-70e7-464c-bd20-3fdd6360b5a8"),
            },
            new SeamResult
            {
                Id = Guid.Parse("fad9af89-a8a1-4b96-85e3-3d544cdfdb56"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("c0a6379f-f3a4-408b-ba14-fe2d0e88a448"),
            },
            new SeamResult
            {
                Id = Guid.Parse("06553b1b-87e7-42ae-83bf-ac915be8078f"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("2746fa18-b544-47d4-ab17-1d3d9fd1976b"),
            },
            new SeamResult
            {
                Id = Guid.Parse("0eb27288-7c24-49db-a19a-e2cf8f110b2f"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("c7e2e6c7-fef6-486b-a56a-4b2744eabf23"),
            },
            new SeamResult
            {
                Id = Guid.Parse("1676d3cb-3c0d-42ca-bab5-f56d9253dda5"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("e0ea7f94-0adc-4c33-b720-addca64766f0"),
            },
            new SeamResult
            {
                Id = Guid.Parse("1990b65e-8b00-4875-9eb6-09b160627406"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("387845e7-e55d-4d35-a985-7c32e12c28d6"),
            },
            new SeamResult
            {
                Id = Guid.Parse("205577de-791e-402d-ac26-b4510ecfaf1f"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("849aa625-1322-46db-96a0-5e53e2b49637"),
            },
            new SeamResult
            {
                Id = Guid.Parse("230325b4-4a5a-4ae9-b5e2-f8d82d749d46"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("04cf134f-238e-41f5-8a45-cba19dfe76bf"),
            },
            new SeamResult
            {
                Id = Guid.Parse("26903a57-eb94-4ccc-a817-c9b0ae1c7939"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("849aa625-1322-46db-96a0-5e53e2b49637"),
            },
            new SeamResult
            {
                Id = Guid.Parse("337e1498-da20-42e6-9d7d-4395658e56f1"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("e0ea7f94-0adc-4c33-b720-addca64766f0"),
            },
            new SeamResult
            {
                Id = Guid.Parse("42faf026-e700-469b-a684-a24e20978ca1"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("f73d8168-9a60-4c1b-8d70-9f0959ba433a"),
            },
            new SeamResult
            {
                Id = Guid.Parse("482352f1-faee-4ec6-a618-24ff4689cce5"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("b8e55393-d436-489c-9b9e-41a4edb846b3"),
            },
            new SeamResult
            {
                Id = Guid.Parse("4cf620a8-7571-4146-8496-d1efe8c45b1c"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("b883fc4a-9d3b-443b-b4f1-e7961742b517"),
            },
            new SeamResult
            {
                Id = Guid.Parse("5587c932-9154-44a3-8ff0-fff7716b515c"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("5ee6731f-5947-49ec-9008-d9727c0aea9f"),
            },
            new SeamResult
            {
                Id = Guid.Parse("59429381-d3c7-44a1-836e-0c63648ff1bd"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("130b1383-1175-4ce5-bc98-77c733773236"),
            },
            new SeamResult
            {
                Id = Guid.Parse("64695761-6d2c-4384-9fd4-3ba6435760ba"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("c7e2e6c7-fef6-486b-a56a-4b2744eabf23"),
            },
            new SeamResult
            {
                Id = Guid.Parse("64d7541c-17a2-47a2-ab10-df4068cca306"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("09aa7df6-34f9-4511-869c-e05bd378bea3"),
            },
            new SeamResult
            {
                Id = Guid.Parse("68dff6e6-9939-43c8-9ded-b5b1e90b630d"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("6956cb84-a66f-4911-837a-2ee9ca75772f"),
            },
            new SeamResult
            {
                Id = Guid.Parse("6a51829c-9dbb-4204-9544-31836e2cdedf"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("2746fa18-b544-47d4-ab17-1d3d9fd1976b"),
            },
            new SeamResult
            {
                Id = Guid.Parse("6c1575eb-b01c-46d1-979d-f43bb9a6fdd2"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("387845e7-e55d-4d35-a985-7c32e12c28d6"),
            },
            new SeamResult
            {
                Id = Guid.Parse("6e7aa6a0-bc86-44f8-8abf-71dd19ffd06b"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("e0ea7f94-0adc-4c33-b720-addca64766f0"),
            },
            new SeamResult
            {
                Id = Guid.Parse("6ff8bd31-33d6-498e-aab9-65c1bb5400a7"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("e1b86536-0c78-4dc2-abb3-414cea5d1c94"),
            },
            new SeamResult
            {
                Id = Guid.Parse("703dede1-b2df-4113-bd43-372b6f4dc407"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("b8e55393-d436-489c-9b9e-41a4edb846b3"),
            },
            new SeamResult
            {
                Id = Guid.Parse("76521aa0-3f92-412d-a918-bbff43fd0657"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("e1b86536-0c78-4dc2-abb3-414cea5d1c94"),
            },
            new SeamResult
            {
                Id = Guid.Parse("7edb81ad-f92a-4efc-a187-d525c937a0f8"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("b883fc4a-9d3b-443b-b4f1-e7961742b517"),
            },
            new SeamResult
            {
                Id = Guid.Parse("8348edf2-4265-4513-b0f9-afb485fc32eb"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("bc85fbb8-8d5d-4ada-9d10-512b940a94b2"),
            },
            new SeamResult
            {
                Id = Guid.Parse("8999fab1-6746-4839-a6f5-f1f15e7d3b3e"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("c3f68fce-6e06-4298-83e9-b70c24de3f58"),
            },
            new SeamResult
            {
                Id = Guid.Parse("8ce6dd53-5ecd-4d9a-9453-a189cf78b1e4"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("f067c76f-cb29-45c9-a441-28a9706a3419"),
            },
            new SeamResult
            {
                Id = Guid.Parse("8e9c2768-f7a8-4ef8-9791-50f779373e14"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("bc85fbb8-8d5d-4ada-9d10-512b940a94b2"),
            },
            new SeamResult
            {
                Id = Guid.Parse("91667b93-7c96-49a0-885a-59c429f15411"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("6956cb84-a66f-4911-837a-2ee9ca75772f"),
            },
            new SeamResult
            {
                Id = Guid.Parse("94f47dc3-cb76-4c23-b83a-c9c7157176ef"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("b883fc4a-9d3b-443b-b4f1-e7961742b517"),
            },
            new SeamResult
            {
                Id = Guid.Parse("9530c52b-500b-4c2c-a895-648170b77d30"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("04cf134f-238e-41f5-8a45-cba19dfe76bf"),
            },
            new SeamResult
            {
                Id = Guid.Parse("97713297-fc8d-4381-bbe6-c50316dc54c3"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("f067c76f-cb29-45c9-a441-28a9706a3419"),
            },
            new SeamResult
            {
                Id = Guid.Parse("997a42a1-1994-4f21-bfd7-2cfd12a1e02d"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("09aa7df6-34f9-4511-869c-e05bd378bea3"),
            },
            new SeamResult
            {
                Id = Guid.Parse("9a4c73fd-d88d-4c88-8d64-359145b76e1c"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("6956cb84-a66f-4911-837a-2ee9ca75772f"),
            },
            new SeamResult
            {
                Id = Guid.Parse("9b8c1bee-78d8-4d07-bb8a-235cc695c28c"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("33132c63-5c9c-4e16-ad2a-eb6fb60cb222"),
            },
            new SeamResult
            {
                Id = Guid.Parse("9bb93a1e-17b9-448c-8a09-40da9fd2aff4"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("04cf134f-238e-41f5-8a45-cba19dfe76bf"),
            },
            new SeamResult
            {
                Id = Guid.Parse("a0364856-b69a-4168-aae4-cc24f4aa0d48"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("849aa625-1322-46db-96a0-5e53e2b49637"),
            },
            new SeamResult
            {
                Id = Guid.Parse("a055701a-107b-4f5b-b7c9-4f309685fc3b"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("5ee6731f-5947-49ec-9008-d9727c0aea9f"),
            },
            new SeamResult
            {
                Id = Guid.Parse("a4b452f3-550c-4024-bcd3-c377975c6407"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("2746fa18-b544-47d4-ab17-1d3d9fd1976b"),
            },
            new SeamResult
            {
                Id = Guid.Parse("abe40518-7229-4d5a-a6d5-ecb8e5310525"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("f73d8168-9a60-4c1b-8d70-9f0959ba433a"),
            },
            new SeamResult
            {
                Id = Guid.Parse("ba0cd2f6-cd01-4c21-9392-feaee59b28d4"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("f067c76f-cb29-45c9-a441-28a9706a3419"),
            },
            new SeamResult
            {
                Id = Guid.Parse("c883ce7a-9ed5-4fc4-8b9d-59907fddcce5"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("5ee6731f-5947-49ec-9008-d9727c0aea9f"),
            },
            new SeamResult
            {
                Id = Guid.Parse("cc379005-dab6-4781-8da7-e89df09e5440"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("bc85fbb8-8d5d-4ada-9d10-512b940a94b2"),
            },
            new SeamResult
            {
                Id = Guid.Parse("d47d5833-ef49-4623-8c15-066eca80a718"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("c3f68fce-6e06-4298-83e9-b70c24de3f58"),
            },
            new SeamResult
            {
                Id = Guid.Parse("d5f02435-0f51-49ef-b065-77111172595c"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("c3f68fce-6e06-4298-83e9-b70c24de3f58"),
            },
            new SeamResult
            {
                Id = Guid.Parse("d8257186-a50b-4acc-9bca-2c2529213bcd"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("130b1383-1175-4ce5-bc98-77c733773236"),
            },
            new SeamResult
            {
                Id = Guid.Parse("d90a34c3-ab64-4876-b068-9d592fb6f929"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("b8e55393-d436-489c-9b9e-41a4edb846b3"),
            },
            new SeamResult
            {
                Id = Guid.Parse("df91bc81-1852-4506-8aad-f2b0054fa46c"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("e1b86536-0c78-4dc2-abb3-414cea5d1c94"),
            },
            new SeamResult
            {
                Id = Guid.Parse("e2ffef7f-29c2-4634-8fbc-c530b6a0a844"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("09aa7df6-34f9-4511-869c-e05bd378bea3"),
            },
            new SeamResult
            {
                Id = Guid.Parse("e35163fa-b5a7-45c0-9f1a-efcca89aef1d"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("c7e2e6c7-fef6-486b-a56a-4b2744eabf23"),
            },
            new SeamResult
            {
                Id = Guid.Parse("e8639881-40a8-4b07-95b0-207a8b3ff453"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("33132c63-5c9c-4e16-ad2a-eb6fb60cb222"),
            },
            new SeamResult
            {
                Id = Guid.Parse("f65a1e18-30ac-4c4e-8639-742803dfbf92"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("33132c63-5c9c-4e16-ad2a-eb6fb60cb222"),
            },
            new SeamResult
            {
                Id = Guid.Parse("f84397f3-2090-4e17-9686-72251fcac721"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("387845e7-e55d-4d35-a985-7c32e12c28d6"),
            },
            new SeamResult
            {
                Id = Guid.Parse("f98896bf-c8de-4b71-8352-7522f01b2d14"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("f73d8168-9a60-4c1b-8d70-9f0959ba433a"),
            },
            new SeamResult
            {
                Id = Guid.Parse("fca41418-3cc4-4d36-9c93-2005808789ed"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("130b1383-1175-4ce5-bc98-77c733773236"),
            },
            new SeamResult
            {
                Id = Guid.Parse("03079d3f-3111-43b8-a55e-4aa520a4ac07"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("db69d3bc-7ad2-42ea-aa49-2241725a0c86"),
            },
            new SeamResult
            {
                Id = Guid.Parse("12441163-8462-4467-8407-b8f43c1a8864"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("ee0711cd-0e77-404d-a707-6a174be3c3ef"),
            },
            new SeamResult
            {
                Id = Guid.Parse("14bbeffa-8202-4d5a-90c2-af3e137be811"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("71625ce2-1b5f-41e4-bde1-3051ce15fa85"),
            },
            new SeamResult
            {
                Id = Guid.Parse("1ab1d02e-b8a4-4e9d-b3e2-bd2fe6736de8"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("f08640fe-8ca3-4972-9774-91bc1e670348"),
            },
            new SeamResult
            {
                Id = Guid.Parse("28809760-6a7b-4c78-a06e-a4111a575138"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("c0a293ad-1629-4fe9-9b97-afbd8fb070ec"),
            },
            new SeamResult
            {
                Id = Guid.Parse("291c15ca-3066-46f7-a69e-3a473df9beea"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("0661a615-343c-429f-9631-d07bda6e4344"),
            },
            new SeamResult
            {
                Id = Guid.Parse("2b231bf9-7445-4706-9bec-67507ae0b733"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("967794af-1861-4a0a-acc7-f508d28d4668"),
            },
            new SeamResult
            {
                Id = Guid.Parse("2f27ce0e-aa72-47a5-b502-31663f599169"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("ee0711cd-0e77-404d-a707-6a174be3c3ef"),
            },
            new SeamResult
            {
                Id = Guid.Parse("30e6ee6a-7627-48a2-8ac4-a693cbe0c79f"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("027f89f9-7153-4187-b818-5f3354e045cb"),
            },
            new SeamResult
            {
                Id = Guid.Parse("315809df-25ee-469f-a435-ebb1bed54c66"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("26293d16-c404-487c-b067-bac6ec4b4bb3"),
            },
            new SeamResult
            {
                Id = Guid.Parse("36fdbe62-cd61-4249-a2df-04168a70b62d"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("c3805d4f-3b76-481c-ad1f-36652a663aaf"),
            },
            new SeamResult
            {
                Id = Guid.Parse("370a52e3-28f5-49c6-9448-74b95e4a441d"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("5e73be8f-4bcc-462d-9a47-f26a72e06dd8"),
            },
            new SeamResult
            {
                Id = Guid.Parse("4267ba18-7949-4de7-a4b1-66d51e835e77"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("f08640fe-8ca3-4972-9774-91bc1e670348"),
            },
            new SeamResult
            {
                Id = Guid.Parse("47dcd602-3154-4a23-ac0a-d3531bcbd7fe"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("26293d16-c404-487c-b067-bac6ec4b4bb3"),
            },
            new SeamResult
            {
                Id = Guid.Parse("5510136f-f653-4565-9215-6ce90d80d4fb"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("b32ffcb2-a563-4ce7-acff-927db8b6d02b"),
            },
            new SeamResult
            {
                Id = Guid.Parse("5960709f-de9e-4271-bdd4-4397156e956c"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("b0cd15cf-ecc6-4265-a20d-d396de0b64e0"),
            },
            new SeamResult
            {
                Id = Guid.Parse("62f06d30-5ad2-42b0-88a7-272a1bef2c00"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("26293d16-c404-487c-b067-bac6ec4b4bb3"),
            },
            new SeamResult
            {
                Id = Guid.Parse("68f10005-b17e-4fb3-939c-99ca70906ac6"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("0661a615-343c-429f-9631-d07bda6e4344"),
            },
            new SeamResult
            {
                Id = Guid.Parse("6f1d4576-90ed-4934-9798-4a833ff0f5df"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("8897832f-879c-43bd-a2b5-b7da4aa1a272"),
            },
            new SeamResult
            {
                Id = Guid.Parse("71d7f656-7e67-4991-b780-0ce79622bcb9"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("6377cdb0-1874-4d04-a1db-2e8c7b25c161"),
            },
            new SeamResult
            {
                Id = Guid.Parse("8285ce2a-e737-47f4-8e00-26e916a762d8"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("f08640fe-8ca3-4972-9774-91bc1e670348"),
            },
            new SeamResult
            {
                Id = Guid.Parse("8b72acb4-4275-4c74-a4ab-6946db5b7e49"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("8897832f-879c-43bd-a2b5-b7da4aa1a272"),
            },
            new SeamResult
            {
                Id = Guid.Parse("8bf605db-9e97-479a-83fb-c287491fc9a6"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("db69d3bc-7ad2-42ea-aa49-2241725a0c86"),
            },
            new SeamResult
            {
                Id = Guid.Parse("8c8aaed5-b2bf-4e4e-8498-2d31bb5e8d1b"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("b32ffcb2-a563-4ce7-acff-927db8b6d02b"),
            },
            new SeamResult
            {
                Id = Guid.Parse("9008273a-65e5-4796-ae56-91a6b20de70a"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("b0cd15cf-ecc6-4265-a20d-d396de0b64e0"),
            },
            new SeamResult
            {
                Id = Guid.Parse("9511c318-a95e-42ce-9715-55fb46f7a4e4"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("b32ffcb2-a563-4ce7-acff-927db8b6d02b"),
            },
            new SeamResult
            {
                Id = Guid.Parse("96241a19-be28-470c-8979-a45778608c13"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("704d31be-95e2-4b87-9888-344fde635bfa"),
            },
            new SeamResult
            {
                Id = Guid.Parse("978fb474-d4de-48e4-99c7-d1516762cef8"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("b0cd15cf-ecc6-4265-a20d-d396de0b64e0"),
            },
            new SeamResult
            {
                Id = Guid.Parse("9a6463ef-64b8-45ca-8d7c-5151a9dbaae5"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("c0a293ad-1629-4fe9-9b97-afbd8fb070ec"),
            },
            new SeamResult
            {
                Id = Guid.Parse("a4682d53-ea0d-4f1b-af68-a9a3a0f2f0b2"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("5e73be8f-4bcc-462d-9a47-f26a72e06dd8"),
            },
            new SeamResult
            {
                Id = Guid.Parse("a6ebff42-df37-489b-b52c-d6fb6da9ead0"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("967794af-1861-4a0a-acc7-f508d28d4668"),
            },
            new SeamResult
            {
                Id = Guid.Parse("abcca060-5b66-4196-8075-57ab4f2547f8"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("5370718d-9a3a-4d25-8eb5-5d5b6e9c1688"),
            },
            new SeamResult
            {
                Id = Guid.Parse("b1342a8a-cdc6-4950-bd97-9a240f1ffd99"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("5e73be8f-4bcc-462d-9a47-f26a72e06dd8"),
            },
            new SeamResult
            {
                Id = Guid.Parse("b19f045b-8386-4e3c-ac15-062e1ee82e41"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("5370718d-9a3a-4d25-8eb5-5d5b6e9c1688"),
            },
            new SeamResult
            {
                Id = Guid.Parse("b22e6c3b-bb65-4363-b8ff-74868050f98f"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("db69d3bc-7ad2-42ea-aa49-2241725a0c86"),
            },
            new SeamResult
            {
                Id = Guid.Parse("c1642d65-c303-42ab-872a-8fe4f201ce80"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("c3805d4f-3b76-481c-ad1f-36652a663aaf"),
            },
            new SeamResult
            {
                Id = Guid.Parse("c276cb1a-bfb9-4f20-9830-2f6d4d8ca14e"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("c3805d4f-3b76-481c-ad1f-36652a663aaf"),
            },
            new SeamResult
            {
                Id = Guid.Parse("cc1836e9-4198-406a-bba0-f5a914bdbba8"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("5370718d-9a3a-4d25-8eb5-5d5b6e9c1688"),
            },
            new SeamResult
            {
                Id = Guid.Parse("cc602beb-f4d7-433a-92e5-8620765644ff"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("ee0711cd-0e77-404d-a707-6a174be3c3ef"),
            },
            new SeamResult
            {
                Id = Guid.Parse("d2249d8d-78d3-44db-a65d-1bf6b9872334"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("704d31be-95e2-4b87-9888-344fde635bfa"),
            },
            new SeamResult
            {
                Id = Guid.Parse("d80a4c3f-b6ee-4c00-86cc-bd9b2744499e"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("6377cdb0-1874-4d04-a1db-2e8c7b25c161"),
            },
            new SeamResult
            {
                Id = Guid.Parse("de2abc82-7223-4367-834e-75bee9c8ec32"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("4ec711b2-191d-4172-89d7-7daedcbb11f6"),
            },
            new SeamResult
            {
                Id = Guid.Parse("e3de1c2c-430b-4d83-93f0-64ff4f90139d"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("71625ce2-1b5f-41e4-bde1-3051ce15fa85"),
            },
            new SeamResult
            {
                Id = Guid.Parse("e9bf91b4-8e0f-418e-909f-de61ea389556"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("967794af-1861-4a0a-acc7-f508d28d4668"),
            },
            new SeamResult
            {
                Id = Guid.Parse("f0b34dd0-e94c-4efb-bbdf-2066e557aeb4"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("4ec711b2-191d-4172-89d7-7daedcbb11f6"),
            },
            new SeamResult
            {
                Id = Guid.Parse("f4aeaa63-3545-487d-aec9-aedb21c36e64"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("c0a293ad-1629-4fe9-9b97-afbd8fb070ec"),
            },
            new SeamResult
            {
                Id = Guid.Parse("f5382d7a-951e-4e20-bce7-dda52bdb1c89"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("6377cdb0-1874-4d04-a1db-2e8c7b25c161"),
            },
            new SeamResult
            {
                Id = Guid.Parse("f6c709a3-7cd2-4dd7-b0f9-a32092d0645e"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("0661a615-343c-429f-9631-d07bda6e4344"),
            },
            new SeamResult
            {
                Id = Guid.Parse("f767d58f-9018-4101-9cdc-d132b39fc486"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("027f89f9-7153-4187-b818-5f3354e045cb"),
            },
            new SeamResult
            {
                Id = Guid.Parse("fae0962c-7ac1-479f-82f7-69ca54edfcc1"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("8897832f-879c-43bd-a2b5-b7da4aa1a272"),
            },
            new SeamResult
            {
                Id = Guid.Parse("fc6c3853-342a-469c-bf8d-c1545f812887"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("704d31be-95e2-4b87-9888-344fde635bfa"),
            },
            new SeamResult
            {
                Id = Guid.Parse("fd937563-8fd7-4012-8155-65e4d5e6742e"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("71625ce2-1b5f-41e4-bde1-3051ce15fa85"),
            },
            new SeamResult
            {
                Id = Guid.Parse("feefd1e6-1c22-43d5-96cb-679c8ab141b8"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("4ec711b2-191d-4172-89d7-7daedcbb11f6"),
            },
            new SeamResult
            {
                Id = Guid.Parse("ff5299da-4fe7-49a3-9249-b59775ed3f8e"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("027f89f9-7153-4187-b818-5f3354e045cb"),
            },
            new SeamResult
            {
                Id = Guid.Parse("04d078da-35f6-4de0-8811-848e27dfdd00"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("8cfc2ff6-8f97-4d2b-9c08-c4c80acfc2d1"),
            },
            new SeamResult
            {
                Id = Guid.Parse("08f719ab-085e-4478-83be-3054ef3e794d"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("8cfc2ff6-8f97-4d2b-9c08-c4c80acfc2d1"),
            },
            new SeamResult
            {
                Id = Guid.Parse("0b77efbd-3a17-4e0e-91e8-6a34345a4180"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("a68c6ac4-b2ca-4d06-bf33-aea364b8a5c0"),
            },
            new SeamResult
            {
                Id = Guid.Parse("0f50f47a-5c8a-483f-a779-14e424a50cdf"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("f5922f81-a092-4654-9be2-959d25e3ea71"),
            },
            new SeamResult
            {
                Id = Guid.Parse("1418f148-25ab-4389-99fd-497a99b25c26"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("2f3ce90d-79f7-4b5a-b408-b09d2ad38d2d"),
            },
            new SeamResult
            {
                Id = Guid.Parse("141f20e7-f339-4a84-a55c-66e6075622dc"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("26c87d12-adaf-4fb3-b55a-75a16ec52eb4"),
            },
            new SeamResult
            {
                Id = Guid.Parse("18cc69cb-f967-4056-af30-865fd88967b4"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("a2650a8a-3788-4e40-a729-707247a3d33a"),
            },
            new SeamResult
            {
                Id = Guid.Parse("1d0f3546-ceb7-439c-a270-848c74d3763e"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("f0bb0b3e-e4a9-4db3-a42e-f8878e37a450"),
            },
            new SeamResult
            {
                Id = Guid.Parse("27f66215-dfc5-4bb2-aa95-e8f1846d53aa"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("52706001-99aa-4810-9e4e-a65289e97746"),
            },
            new SeamResult
            {
                Id = Guid.Parse("2e5f34c7-2709-4dfc-816f-dd74abda87a4"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("a2650a8a-3788-4e40-a729-707247a3d33a"),
            },
            new SeamResult
            {
                Id = Guid.Parse("3f7f0b4d-1fca-4c65-8df7-4253a2c8d562"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("337bd616-8030-4134-abcf-5a26f497e533"),
            },
            new SeamResult
            {
                Id = Guid.Parse("4212985a-dbd5-4811-9da4-e75011511be3"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("72f840d3-f161-4d54-91fb-8df331acb200"),
            },
            new SeamResult
            {
                Id = Guid.Parse("4bfbef9f-f7ee-4033-be9c-29d9eb90a5ba"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("469f1458-5d18-47d8-a57d-db9200514f1a"),
            },
            new SeamResult
            {
                Id = Guid.Parse("6220fb1e-4d04-49a3-a250-30610961b369"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("26c87d12-adaf-4fb3-b55a-75a16ec52eb4"),
            },
            new SeamResult
            {
                Id = Guid.Parse("63200e94-fe7c-4798-a902-a29682ef1e0f"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("ba876cc6-c721-4606-9ec6-ef62e1ee33be"),
            },
            new SeamResult
            {
                Id = Guid.Parse("6732c80b-e96d-46af-91bf-626540832203"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("72f840d3-f161-4d54-91fb-8df331acb200"),
            },
            new SeamResult
            {
                Id = Guid.Parse("684e3f09-59be-49d8-9108-4761d8c4675f"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("337bd616-8030-4134-abcf-5a26f497e533"),
            },
            new SeamResult
            {
                Id = Guid.Parse("68d489d2-226d-4128-ad6f-e672837988c0"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("2f3ce90d-79f7-4b5a-b408-b09d2ad38d2d"),
            },
            new SeamResult
            {
                Id = Guid.Parse("6eab8c7a-be91-464f-b327-568642bf53a2"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("ebc78c1f-aa01-4de9-b300-24b91f13924d"),
            },
            new SeamResult
            {
                Id = Guid.Parse("6ee9695d-1345-4c59-b7ab-4dac7fcb41cb"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("1be3af55-2897-4fbd-ac5f-46a0b12194b4"),
            },
            new SeamResult
            {
                Id = Guid.Parse("72d82bfa-cbb2-41e8-b206-9031ba0963db"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("1be3af55-2897-4fbd-ac5f-46a0b12194b4"),
            },
            new SeamResult
            {
                Id = Guid.Parse("7829d4f0-ca28-483a-9da7-582117be73cf"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("72f840d3-f161-4d54-91fb-8df331acb200"),
            },
            new SeamResult
            {
                Id = Guid.Parse("7d757055-b247-495f-b1ab-eaa8f99b0545"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("f5922f81-a092-4654-9be2-959d25e3ea71"),
            },
            new SeamResult
            {
                Id = Guid.Parse("8ffea57f-adc2-4923-82b9-7bd2943dfc90"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("f0bb0b3e-e4a9-4db3-a42e-f8878e37a450"),
            },
            new SeamResult
            {
                Id = Guid.Parse("913324ed-4e13-4ade-9b70-54b134e7a95f"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("337bd616-8030-4134-abcf-5a26f497e533"),
            },
            new SeamResult
            {
                Id = Guid.Parse("9276bbf3-7fec-42b0-be86-f2a9b317886c"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("942d3a98-24f1-4d2e-add7-9cefb1d59e7a"),
            },
            new SeamResult
            {
                Id = Guid.Parse("939e5beb-8afe-4b7b-b0ac-305afc233184"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("26c87d12-adaf-4fb3-b55a-75a16ec52eb4"),
            },
            new SeamResult
            {
                Id = Guid.Parse("a182ad26-aba7-4df9-8086-3ef7c12a686c"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("469f1458-5d18-47d8-a57d-db9200514f1a"),
            },
            new SeamResult
            {
                Id = Guid.Parse("a3b3c549-bbd8-4ed3-a1f6-c297a2c22f48"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("e08e99f0-8feb-4041-8034-b3927df2d614"),
            },
            new SeamResult
            {
                Id = Guid.Parse("aaefdc77-757f-4f88-92d9-1d9e42a1fa0f"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("9a26988a-7b50-4358-94bd-4ddde6ae0348"),
            },
            new SeamResult
            {
                Id = Guid.Parse("add24c3f-c0d7-411d-b616-5471332293e4"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("9a26988a-7b50-4358-94bd-4ddde6ae0348"),
            },
            new SeamResult
            {
                Id = Guid.Parse("aed4f53b-84ec-43e8-9a03-31907d5e4065"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("52706001-99aa-4810-9e4e-a65289e97746"),
            },
            new SeamResult
            {
                Id = Guid.Parse("af9d7394-82fa-46f8-9d1e-2ad657d32823"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("21fa2b39-7fac-44a3-bb23-4099a48c8ac5"),
            },
            new SeamResult
            {
                Id = Guid.Parse("b044778d-294a-4adf-904a-4f17e4b9d127"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("8cfc2ff6-8f97-4d2b-9c08-c4c80acfc2d1"),
            },
            new SeamResult
            {
                Id = Guid.Parse("b7554b04-f057-4609-981a-3289e2ac3587"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("52706001-99aa-4810-9e4e-a65289e97746"),
            },
            new SeamResult
            {
                Id = Guid.Parse("b9de5557-a2c5-47c2-aaa4-e7b4dc3deca2"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("a2650a8a-3788-4e40-a729-707247a3d33a"),
            },
            new SeamResult
            {
                Id = Guid.Parse("be40cbd0-7b2f-400b-8b4a-d9665f70416f"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("ba876cc6-c721-4606-9ec6-ef62e1ee33be"),
            },
            new SeamResult
            {
                Id = Guid.Parse("beec8af9-e617-4af0-9eea-58850e3e524a"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("f0bb0b3e-e4a9-4db3-a42e-f8878e37a450"),
            },
            new SeamResult
            {
                Id = Guid.Parse("bfbdd62f-7081-499a-8332-91443b795946"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("942d3a98-24f1-4d2e-add7-9cefb1d59e7a"),
            },
            new SeamResult
            {
                Id = Guid.Parse("c5307fb4-2b7f-46aa-9dc8-15fa418b00e7"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("942d3a98-24f1-4d2e-add7-9cefb1d59e7a"),
            },
            new SeamResult
            {
                Id = Guid.Parse("c6fc31b9-e543-4160-8546-2ccbc1596eec"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("a68c6ac4-b2ca-4d06-bf33-aea364b8a5c0"),
            },
            new SeamResult
            {
                Id = Guid.Parse("c7713d8e-69a1-45c6-9911-5e0f72c5a6a6"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("2f3ce90d-79f7-4b5a-b408-b09d2ad38d2d"),
            },
            new SeamResult
            {
                Id = Guid.Parse("c8dd776d-f03a-4cad-8b56-260a4b04c856"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("e08e99f0-8feb-4041-8034-b3927df2d614"),
            },
            new SeamResult
            {
                Id = Guid.Parse("d4bb0a13-5992-4f4c-ba14-9567fdbb5d3e"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("9a26988a-7b50-4358-94bd-4ddde6ae0348"),
            },
            new SeamResult
            {
                Id = Guid.Parse("d4cc1171-87b0-44e0-a11d-feee16281ef3"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("ebc78c1f-aa01-4de9-b300-24b91f13924d"),
            },
            new SeamResult
            {
                Id = Guid.Parse("d6b12d6b-dca0-4737-ae34-ad52f15dc59b"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("a68c6ac4-b2ca-4d06-bf33-aea364b8a5c0"),
            },
            new SeamResult
            {
                Id = Guid.Parse("dec3dfe6-b942-4e8a-a904-3545a7dfd42c"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("ebc78c1f-aa01-4de9-b300-24b91f13924d"),
            },
            new SeamResult
            {
                Id = Guid.Parse("e18c3112-bc23-41dc-b0bb-112720d674a9"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("e08e99f0-8feb-4041-8034-b3927df2d614"),
            },
            new SeamResult
            {
                Id = Guid.Parse("e73f913c-5b94-4cee-afa1-acf59f7d46b7"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("f5922f81-a092-4654-9be2-959d25e3ea71"),
            },
            new SeamResult
            {
                Id = Guid.Parse("f08aefc2-c783-4ae0-8da2-a9bdfd3beaea"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("21fa2b39-7fac-44a3-bb23-4099a48c8ac5"),
            },
            new SeamResult
            {
                Id = Guid.Parse("f124b7c3-1cb0-4c51-acbf-e36897dd54dd"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("469f1458-5d18-47d8-a57d-db9200514f1a"),
            },
            new SeamResult
            {
                Id = Guid.Parse("f5be10fa-88fe-4089-b554-6ec2b46e1e9b"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("1be3af55-2897-4fbd-ac5f-46a0b12194b4"),
            },
            new SeamResult
            {
                Id = Guid.Parse("fa3515d2-cbc2-4e1d-8b93-94dc60129f78"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("ba876cc6-c721-4606-9ec6-ef62e1ee33be"),
            },
            new SeamResult
            {
                Id = Guid.Parse("fc77ed18-80fd-46a9-a279-aaff99888f2c"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("21fa2b39-7fac-44a3-bb23-4099a48c8ac5"),
            },
            new SeamResult
            {
                Id = Guid.Parse("01664c49-6af7-44dc-8b23-2b06ffc6d9fb"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("a665cb09-4c3b-4a6a-aae4-e0d94e82bc0e"),
            },
            new SeamResult
            {
                Id = Guid.Parse("038bb88b-b977-4966-b679-c63963c46447"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("5d36da69-0aca-4a1b-bb34-a06a231b3f6f"),
            },
            new SeamResult
            {
                Id = Guid.Parse("13eef39e-788e-4785-95da-2182daf92961"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("8b1c1c7d-312f-4e23-99e4-2bed26ac905a"),
            },
            new SeamResult
            {
                Id = Guid.Parse("1610592d-f9a6-47c4-afdc-416467bba6b5"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("fad8a24c-257e-4f45-a42a-c3c504115c4f"),
            },
            new SeamResult
            {
                Id = Guid.Parse("1b7df3ad-6171-4ea2-9939-c88447a1c948"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("cdb19fc4-4d81-4118-948d-ad5cd70d02f8"),
            },
            new SeamResult
            {
                Id = Guid.Parse("1d054573-8559-4a6a-a1e1-4c224bbdc7af"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("2da97ac5-2b00-4366-a8c6-7a5c1566f7d0"),
            },
            new SeamResult
            {
                Id = Guid.Parse("2142298d-c3a4-440d-bd87-c81af041473c"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("deba9e69-47ae-48e2-8e40-2656e210f2d3"),
            },
            new SeamResult
            {
                Id = Guid.Parse("21fa7e7b-c919-44f1-9d07-88efbd8c515d"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("8b1c1c7d-312f-4e23-99e4-2bed26ac905a"),
            },
            new SeamResult
            {
                Id = Guid.Parse("23a88632-3eab-498e-a9f0-b96151483044"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("42fab155-4aa9-4f7c-a523-f9b63aa6068f"),
            },
            new SeamResult
            {
                Id = Guid.Parse("23b256df-6c0a-4211-bd3b-0c2f400cfe5b"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("953c92b8-5754-4e11-b387-31efc9787950"),
            },
            new SeamResult
            {
                Id = Guid.Parse("2731462f-63af-4fca-998a-f1cfc81753b6"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("f81a1dc2-5a88-4ce6-8d78-1d498ce17540"),
            },
            new SeamResult
            {
                Id = Guid.Parse("2a58fd28-5dcf-417c-8484-44fc45a46905"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("2abdbaac-932c-4f92-8362-11cfaa23edd4"),
            },
            new SeamResult
            {
                Id = Guid.Parse("2d034ee8-6546-4db4-a58d-4fac8936c711"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("028bc8eb-381b-4874-b644-54a7c0c82644"),
            },
            new SeamResult
            {
                Id = Guid.Parse("36a7d0c0-fffb-4f04-a055-af297b3209dc"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("6033556d-955d-4c20-a869-4811bc5429b7"),
            },
            new SeamResult
            {
                Id = Guid.Parse("3cbfadfc-e667-4e44-aa36-f64414aa5c3b"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("0c5b8a87-4acd-4f02-b2dc-5fa89d347459"),
            },
            new SeamResult
            {
                Id = Guid.Parse("3e113de8-c99f-4970-a15b-d349898e9fd9"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("2b26d3b6-d99c-4168-9f87-e5d8d1b745f6"),
            },
            new SeamResult
            {
                Id = Guid.Parse("4187b6e9-ccec-4be6-98aa-c594bcbb77e4"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("fad8a24c-257e-4f45-a42a-c3c504115c4f"),
            },
            new SeamResult
            {
                Id = Guid.Parse("449503b4-4028-49e7-8009-94103e44b642"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("deba9e69-47ae-48e2-8e40-2656e210f2d3"),
            },
            new SeamResult
            {
                Id = Guid.Parse("4567716e-f9fb-4403-bb66-1124f9a2ddb9"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("42fab155-4aa9-4f7c-a523-f9b63aa6068f"),
            },
            new SeamResult
            {
                Id = Guid.Parse("4e653c75-1d88-4b1e-a36e-4d4fb8ac932a"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("466740f5-ef04-4304-aee0-386785922899"),
            },
            new SeamResult
            {
                Id = Guid.Parse("5bb92660-f0c5-4402-891c-bafb54b7e734"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("5d36da69-0aca-4a1b-bb34-a06a231b3f6f"),
            },
            new SeamResult
            {
                Id = Guid.Parse("64651da0-4db5-46a5-9980-42036af636ea"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("953c92b8-5754-4e11-b387-31efc9787950"),
            },
            new SeamResult
            {
                Id = Guid.Parse("6c685612-4dda-4f6d-8b83-e509553239f8"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("2abdbaac-932c-4f92-8362-11cfaa23edd4"),
            },
            new SeamResult
            {
                Id = Guid.Parse("7335747e-aea2-4095-b74d-6f0e2c713003"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("0c5b8a87-4acd-4f02-b2dc-5fa89d347459"),
            },
            new SeamResult
            {
                Id = Guid.Parse("7aa0c402-32fa-43ca-a061-35a3f551dd64"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("2da97ac5-2b00-4366-a8c6-7a5c1566f7d0"),
            },
            new SeamResult
            {
                Id = Guid.Parse("83e210a9-a14e-44e1-a823-f12bf2fb20f0"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("2abdbaac-932c-4f92-8362-11cfaa23edd4"),
            },
            new SeamResult
            {
                Id = Guid.Parse("892fe2a1-9b7e-4f59-a013-93a7a38109da"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("028bc8eb-381b-4874-b644-54a7c0c82644"),
            },
            new SeamResult
            {
                Id = Guid.Parse("8f0b0bd3-dd80-42ba-a322-899ac41ab4b1"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("6033556d-955d-4c20-a869-4811bc5429b7"),
            },
            new SeamResult
            {
                Id = Guid.Parse("95d73f35-6372-4200-bfc1-617452f217d0"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("6033556d-955d-4c20-a869-4811bc5429b7"),
            },
            new SeamResult
            {
                Id = Guid.Parse("991e18a1-a969-4055-876e-dc5cd137c342"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("f81a1dc2-5a88-4ce6-8d78-1d498ce17540"),
            },
            new SeamResult
            {
                Id = Guid.Parse("a0b067f5-5d73-4bd4-abd5-bc4e5a7b8f61"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("fad8a24c-257e-4f45-a42a-c3c504115c4f"),
            },
            new SeamResult
            {
                Id = Guid.Parse("a6d1619d-0b76-4fa0-bfa3-424ba97080ac"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("a665cb09-4c3b-4a6a-aae4-e0d94e82bc0e"),
            },
            new SeamResult
            {
                Id = Guid.Parse("a6df33f6-6bfd-4a89-96b9-85d75574c7a6"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("f77835a2-1cc5-40f4-923f-37b2ea6b19ad"),
            },
            new SeamResult
            {
                Id = Guid.Parse("a8ed27b9-0894-4c55-9186-5a421a152f60"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("e873da1d-b22c-46d2-99c1-d8ab66afe94d"),
            },
            new SeamResult
            {
                Id = Guid.Parse("ad7a20cf-2d47-45dd-9c10-5785db5f693c"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("2da97ac5-2b00-4366-a8c6-7a5c1566f7d0"),
            },
            new SeamResult
            {
                Id = Guid.Parse("b0edda9f-5991-4977-825f-82e3a9558955"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("0c5b8a87-4acd-4f02-b2dc-5fa89d347459"),
            },
            new SeamResult
            {
                Id = Guid.Parse("b25aad1e-b3b8-4d45-ab34-3eb1e16aeb23"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("f77835a2-1cc5-40f4-923f-37b2ea6b19ad"),
            },
            new SeamResult
            {
                Id = Guid.Parse("b50d9c5d-9e76-481a-a274-6300d943dbb6"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("2b26d3b6-d99c-4168-9f87-e5d8d1b745f6"),
            },
            new SeamResult
            {
                Id = Guid.Parse("b86e84ed-e410-4916-b90d-6762649ac416"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("e873da1d-b22c-46d2-99c1-d8ab66afe94d"),
            },
            new SeamResult
            {
                Id = Guid.Parse("bd87f76f-2eeb-4a17-b1d7-820100427c38"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("028bc8eb-381b-4874-b644-54a7c0c82644"),
            },
            new SeamResult
            {
                Id = Guid.Parse("c0c8c7fc-a77f-4d1d-afa5-4f05231b3a7b"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("8b1c1c7d-312f-4e23-99e4-2bed26ac905a"),
            },
            new SeamResult
            {
                Id = Guid.Parse("c836b2c1-3bc9-4358-8614-332c51352a51"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("466740f5-ef04-4304-aee0-386785922899"),
            },
            new SeamResult
            {
                Id = Guid.Parse("ca11a6c4-dfca-4d51-8e84-b223ca477d4e"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("5d36da69-0aca-4a1b-bb34-a06a231b3f6f"),
            },
            new SeamResult
            {
                Id = Guid.Parse("d14488e4-ffae-42c8-86dd-2ec351fa3512"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("f81a1dc2-5a88-4ce6-8d78-1d498ce17540"),
            },
            new SeamResult
            {
                Id = Guid.Parse("d7cd69fd-b09c-4dc4-aed9-85ca70489022"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("a665cb09-4c3b-4a6a-aae4-e0d94e82bc0e"),
            },
            new SeamResult
            {
                Id = Guid.Parse("de97c95f-e3e0-48b8-b16e-c0461cf0eee5"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("e873da1d-b22c-46d2-99c1-d8ab66afe94d"),
            },
            new SeamResult
            {
                Id = Guid.Parse("e1105ff1-30c0-4a7c-a632-87d02b97da16"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("cdb19fc4-4d81-4118-948d-ad5cd70d02f8"),
            },
            new SeamResult
            {
                Id = Guid.Parse("e447e957-6a23-4bd0-8bd3-59d75cf38786"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("466740f5-ef04-4304-aee0-386785922899"),
            },
            new SeamResult
            {
                Id = Guid.Parse("e64b5af7-9d40-47c3-9f15-b0c47c87a2e9"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("2b26d3b6-d99c-4168-9f87-e5d8d1b745f6"),
            },
            new SeamResult
            {
                Id = Guid.Parse("e6ff8ffa-e9ac-4a24-9208-ca79c7816bbd"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("953c92b8-5754-4e11-b387-31efc9787950"),
            },
            new SeamResult
            {
                Id = Guid.Parse("e90ebe26-8cbd-477a-ad32-09a623473756"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("42fab155-4aa9-4f7c-a523-f9b63aa6068f"),
            },
            new SeamResult
            {
                Id = Guid.Parse("e9b09945-d88e-4506-b198-077586faa949"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("cdb19fc4-4d81-4118-948d-ad5cd70d02f8"),
            },
            new SeamResult
            {
                Id = Guid.Parse("eddbbd78-a41d-4ad3-87e4-d23f7583db50"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("deba9e69-47ae-48e2-8e40-2656e210f2d3"),
            },
            new SeamResult
            {
                Id = Guid.Parse("f940a8ef-b7f1-4e71-818f-79f82cc645b3"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("f77835a2-1cc5-40f4-923f-37b2ea6b19ad"),
            },
            new SeamResult
            {
                Id = Guid.Parse("0482dcdd-64b4-444c-bad6-8ad19a961c2a"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("bb4351b2-365a-4a75-b696-564a8d8d2d2a"),
            },
            new SeamResult
            {
                Id = Guid.Parse("0b999e96-b17c-434e-a7a0-4213112ef032"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("e2a4b9c5-fa4f-440b-94b0-53b6bb72f6ce"),
            },
            new SeamResult
            {
                Id = Guid.Parse("0de0cd38-74a4-4bcd-b897-62a471c46cae"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("e2a4b9c5-fa4f-440b-94b0-53b6bb72f6ce"),
            },
            new SeamResult
            {
                Id = Guid.Parse("1504cefd-7480-4583-a731-41ac08c8b724"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("00cb83c3-83f6-410e-8155-bf41003488a6"),
            },
            new SeamResult
            {
                Id = Guid.Parse("1954ea5a-6675-4389-83b6-90e1c8dd8cd3"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("c21e1ee0-08d3-4659-bb29-c44420d75f75"),
            },
            new SeamResult
            {
                Id = Guid.Parse("1cab690d-480c-4492-bd7e-d3e25c9ca29f"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("94d371f5-8465-40de-94db-c7171c6c7f5e"),
            },
            new SeamResult
            {
                Id = Guid.Parse("2e887780-9f00-445c-b210-ef1422c0b145"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("0dda6661-909b-44da-8f91-e38864826211"),
            },
            new SeamResult
            {
                Id = Guid.Parse("3028c23c-6222-4661-a515-e9bb9b6be527"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("e5224af5-efd6-4c9c-85dd-ac627b03065e"),
            },
            new SeamResult
            {
                Id = Guid.Parse("347ced20-c15f-4f6d-bd54-158a014cffe5"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("8ce1ea61-9b28-4106-b88c-ef858cbac8a4"),
            },
            new SeamResult
            {
                Id = Guid.Parse("398b5c93-b2a0-4269-9075-0fd292eacc27"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("75ae6cec-349c-416a-964b-a00db785ce66"),
            },
            new SeamResult
            {
                Id = Guid.Parse("442055c4-2124-4b57-bdbf-9f93f3bd8608"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("e5224af5-efd6-4c9c-85dd-ac627b03065e"),
            },
            new SeamResult
            {
                Id = Guid.Parse("481d3baa-bb67-409c-a052-f4458ce7eb4f"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("beef8eb5-c616-4c33-bc0f-f5359d73d6dd"),
            },
            new SeamResult
            {
                Id = Guid.Parse("499ad941-0dca-459a-af3c-2670927756cf"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("acdd88d3-7d58-4bd3-9a20-96333b0a21ac"),
            },
            new SeamResult
            {
                Id = Guid.Parse("4cfc37fb-e4e9-4ca4-96bf-6c2eccfd408a"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("00cb83c3-83f6-410e-8155-bf41003488a6"),
            },
            new SeamResult
            {
                Id = Guid.Parse("5073461e-f36e-4c0b-8407-d9e2d839e279"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("75ae6cec-349c-416a-964b-a00db785ce66"),
            },
            new SeamResult
            {
                Id = Guid.Parse("51a56bfb-0078-45be-b348-2e30db26cadf"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("e5224af5-efd6-4c9c-85dd-ac627b03065e"),
            },
            new SeamResult
            {
                Id = Guid.Parse("54460440-7b47-4f7f-87d9-83774173a294"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("beef8eb5-c616-4c33-bc0f-f5359d73d6dd"),
            },
            new SeamResult
            {
                Id = Guid.Parse("56fab0f7-fed6-49cc-9e2a-eca8a3c48146"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("1b4d0123-0798-4032-bc8f-35f6f7fc5695"),
            },
            new SeamResult
            {
                Id = Guid.Parse("5b392542-adf5-45cb-935b-a37d2afd212d"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("f9eaf1fa-4c8e-41a9-833a-d4a4f3e0d1bf"),
            },
            new SeamResult
            {
                Id = Guid.Parse("5cb1a04d-0042-477c-ab01-44a6c149ed9f"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("1b4d0123-0798-4032-bc8f-35f6f7fc5695"),
            },
            new SeamResult
            {
                Id = Guid.Parse("62e3e328-8fd7-4a79-9af7-3942edadfcf7"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("9cbbd6d9-ce5b-4d3c-854c-1a08b5d504a4"),
            },
            new SeamResult
            {
                Id = Guid.Parse("67a17684-9677-47ff-86c5-481eef8e332d"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("8ce1ea61-9b28-4106-b88c-ef858cbac8a4"),
            },
            new SeamResult
            {
                Id = Guid.Parse("696407fe-b2b1-4178-8a3b-c7e832a0dc42"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("d953a03c-5ef9-4a86-af45-1ee6ae635549"),
            },
            new SeamResult
            {
                Id = Guid.Parse("6fbe7f4c-ca15-411c-b82c-d03e809b9291"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("00cb83c3-83f6-410e-8155-bf41003488a6"),
            },
            new SeamResult
            {
                Id = Guid.Parse("72bb7a45-ff8f-4b0e-8d59-86bc47ec28fe"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("b6474d85-7846-42e0-abfd-0db793bf2e98"),
            },
            new SeamResult
            {
                Id = Guid.Parse("76b0cb66-047d-4bd1-b617-c94fff9e1c6b"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("d953a03c-5ef9-4a86-af45-1ee6ae635549"),
            },
            new SeamResult
            {
                Id = Guid.Parse("7f19cdad-9692-466f-a43e-ddfd08c89eab"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("acdd88d3-7d58-4bd3-9a20-96333b0a21ac"),
            },
            new SeamResult
            {
                Id = Guid.Parse("8392ccd2-70bf-4de2-b298-d28eefc4317e"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("c8b079e1-d872-4c92-b8fd-6546a7f8a0e1"),
            },
            new SeamResult
            {
                Id = Guid.Parse("9bd70336-cfcd-475b-a7b9-824577d91a22"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("0dda6661-909b-44da-8f91-e38864826211"),
            },
            new SeamResult
            {
                Id = Guid.Parse("9e920554-1068-4996-befb-c6ea38c28813"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("94d371f5-8465-40de-94db-c7171c6c7f5e"),
            },
            new SeamResult
            {
                Id = Guid.Parse("a738ec49-6af5-4bbc-b560-1e00c88635c6"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("e2a4b9c5-fa4f-440b-94b0-53b6bb72f6ce"),
            },
            new SeamResult
            {
                Id = Guid.Parse("a9fe3f9c-3970-4948-8c9d-b7feb5116274"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("9cbbd6d9-ce5b-4d3c-854c-1a08b5d504a4"),
            },
            new SeamResult
            {
                Id = Guid.Parse("b184b347-6b0d-4aea-a983-31fd8c404cd3"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("75ae6cec-349c-416a-964b-a00db785ce66"),
            },
            new SeamResult
            {
                Id = Guid.Parse("be42b563-91e2-47bd-9607-a17f3061b92c"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("f9eaf1fa-4c8e-41a9-833a-d4a4f3e0d1bf"),
            },
            new SeamResult
            {
                Id = Guid.Parse("c51dd523-1d77-40b4-a2bb-820425df1e20"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("c8b079e1-d872-4c92-b8fd-6546a7f8a0e1"),
            },
            new SeamResult
            {
                Id = Guid.Parse("c7de252d-21d9-4c66-baa5-1fe8e7846f63"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("f9eaf1fa-4c8e-41a9-833a-d4a4f3e0d1bf"),
            },
            new SeamResult
            {
                Id = Guid.Parse("c976c548-fe8a-47f2-9cf3-973c6d12acb5"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("acdd88d3-7d58-4bd3-9a20-96333b0a21ac"),
            },
            new SeamResult
            {
                Id = Guid.Parse("cbb37834-4540-42ea-a9b3-2f8fa1cc6d67"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("c21e1ee0-08d3-4659-bb29-c44420d75f75"),
            },
            new SeamResult
            {
                Id = Guid.Parse("ce60f3ad-4969-4865-8406-ae175dccc919"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("c21e1ee0-08d3-4659-bb29-c44420d75f75"),
            },
            new SeamResult
            {
                Id = Guid.Parse("d199ee2b-99c3-44fc-88dd-061dfaeab371"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("d2015664-befe-4b70-b622-46df1a994108"),
            },
            new SeamResult
            {
                Id = Guid.Parse("d242e6d1-7729-47cf-b62b-26a1d4094256"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("0dda6661-909b-44da-8f91-e38864826211"),
            },
            new SeamResult
            {
                Id = Guid.Parse("d8245515-b21e-43eb-95b2-44bad75cf4ab"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("bb4351b2-365a-4a75-b696-564a8d8d2d2a"),
            },
            new SeamResult
            {
                Id = Guid.Parse("dce9557b-84bf-4834-9b05-de34bc1fb2ac"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                SeamAccountId = Guid.Parse("d2015664-befe-4b70-b622-46df1a994108"),
            },
            new SeamResult
            {
                Id = Guid.Parse("dd0dbced-c11b-479f-8c15-c7b8b90f43b8"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("b6474d85-7846-42e0-abfd-0db793bf2e98"),
            },
            new SeamResult
            {
                Id = Guid.Parse("dd213d79-564a-48a7-99c6-76d960619ee9"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("8ce1ea61-9b28-4106-b88c-ef858cbac8a4"),
            },
            new SeamResult
            {
                Id = Guid.Parse("e84e7a69-4e73-4e1c-b019-142b4d61bb41"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("9cbbd6d9-ce5b-4d3c-854c-1a08b5d504a4"),
            },
            new SeamResult
            {
                Id = Guid.Parse("e8b8ca2f-69df-494a-ae56-dc080690bb68"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("b6474d85-7846-42e0-abfd-0db793bf2e98"),
            },
            new SeamResult
            {
                Id = Guid.Parse("ea70a2eb-1c16-4510-b15d-6f30423430a7"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("d2015664-befe-4b70-b622-46df1a994108"),
            },
            new SeamResult
            {
                Id = Guid.Parse("ef2f0f90-8c26-42b9-9d36-adf45b02ce4b"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("d953a03c-5ef9-4a86-af45-1ee6ae635549"),
            },
            new SeamResult
            {
                Id = Guid.Parse("f0898f34-737f-461d-8648-1471af229fcc"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("1b4d0123-0798-4032-bc8f-35f6f7fc5695"),
            },
            new SeamResult
            {
                Id = Guid.Parse("f17a9d12-ea0e-459e-983e-4fa2ddee7066"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("c8b079e1-d872-4c92-b8fd-6546a7f8a0e1"),
            },
            new SeamResult
            {
                Id = Guid.Parse("f1d2eee4-d130-4e24-b3c7-0e2c9cae514c"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                SeamAccountId = Guid.Parse("beef8eb5-c616-4c33-bc0f-f5359d73d6dd"),
            },
            new SeamResult
            {
                Id = Guid.Parse("fa28267d-d6ef-4f7a-92e2-7bdee755ace2"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("94d371f5-8465-40de-94db-c7171c6c7f5e"),
            },
            new SeamResult
            {
                Id = Guid.Parse("fc9ea568-4283-4ff0-bfca-d991ac06f7a3"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                SeamAccountId = Guid.Parse("bb4351b2-365a-4a75-b696-564a8d8d2d2a"),
            },
        };

        return seamResults;
    }
}