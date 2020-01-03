module OmniauthMacros
  def twitter_mock
    OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new(
      {
        provider: 'twitter',
        uid: '12345',
        info: {
          name: 'mockuser',
          email: 'sample@test.com'
        },
        credentials: {
          token: 'hogefuga'
        }
      }
    )
  end
end