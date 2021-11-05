import passport from 'passport';
import { Strategy as LocalStrategy } from 'passport-local';
import { BasicStrategy } from 'passport-http';
import BCrypt from 'bcrypt';
import { UserModel } from './models/user';


export class PassportStrategyInitializer {

  public init() {
    console.log('setting up passport');

    passport.use(new LocalStrategy({ usernameField: 'email' },
      async (email, password, done) => {
        console.log('using passport');
        try {
          email = email.toLowerCase();
          let user = await UserModel.findOne({ email }).exec();
          if (!user) return done(null, false, { message: 'No user with that email address was found.' });

          var isMatch = await BCrypt.compare(password, user.password);
          if (!isMatch) {
            return done(null, false, { message: 'Incorrect password.' });
          }

          return done(null, user);

        } catch (err) {
          console.log("passport strategy error", err);
          return done(err);
        }
      }
    ));

    passport.serializeUser((user, done) => {
      console.log('passport serialize user', user);
      return done(null, user['_id']);
    });

    passport.deserializeUser(async (id, done) => {
      try {
        var user = await UserModel.findOne({ _id: id }).exec();
        return done(null, user);
      } catch (err) {
        return done(err);
      }
    });
  }
}
