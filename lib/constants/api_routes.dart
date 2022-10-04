enum FightsApiRoute {
  base,
  id,
  tokens,
}

enum UsersApiRoute {
  base,
  me,
}

abstract class ApiRoute {
  static const users = {
    UsersApiRoute.base: '/users',
    UsersApiRoute.me: '/users/me',
  };

  static const fights = {
    FightsApiRoute.base: '/fights',
    FightsApiRoute.id: '/fights',
    FightsApiRoute.tokens: '/fights/tokens',
  };
}
