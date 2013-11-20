Fabricator(:user) do
  name "Sample User"
  provider "twitter"
  uid {Fabricate.sequence(:uid)}
end