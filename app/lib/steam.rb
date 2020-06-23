module Steam
  class SteamApiError < StandardError; end
  class TooManyRequestsError < SteamApiError; end
  class NilResponseError < SteamApiError; end
end