/// Uygulama feature key'leri — kaynak: web `src/lib/features.ts` (Schema Pack: docs/contract/feature_keys.md).
/// Bu sabitler web sözleşmesiyle birebir eşleşmelidir.
library;

/// Generic (rol-tabanlı) feature key'ler.
class GenericFeatureKeys {
  const GenericFeatureKeys._();

  static const profileViewOwn = 'profile.view_own';
  static const profileEditOwn = 'profile.edit_own';
  static const profileEditPublic = 'profile.edit_public';
  static const profileLinkedinCard = 'profile.linkedin_card';
  static const profileWebsiteCard = 'profile.website_card';
  static const profileCvUpload = 'profile.cv_upload';
  static const profilePresentationUpload = 'profile.presentation_upload';
  static const caddeAccess = 'cadde.access';
  static const directoryVisible = 'directory.visible';
  static const directoryFeatured = 'directory.featured';
  static const contactReceive = 'contact.receive';
  static const contactShowWhatsapp = 'contact.show_whatsapp';
  static const contentCreate = 'content.create';
  static const contentEditOwn = 'content.edit_own';
  static const eventsCreate = 'events.create';
  static const offersCreate = 'offers.create';
  static const referralCreate = 'referral.create';
  static const cityManage = 'city.manage';
  static const adminRequiresApproval = 'admin.requires_approval';
  static const whatsappLandingEditAssigned = 'whatsapp_landing.edit_assigned';
}

/// Legacy bireysel profil feature key'leri (`individual.` prefix).
class IndividualFeatureKeys {
  const IndividualFeatureKeys._();

  static const about = 'individual.about';
  static const serviceRequests = 'individual.service_requests';
  static const events = 'individual.events';
  static const follows = 'individual.follows';
  static const whatsapp = 'individual.whatsapp';
  static const messages = 'individual.messages';
  static const activity = 'individual.activity';
  static const cvRequest = 'individual.cv_request';
  static const jobSeekingBadge = 'individual.job_seeking_badge';
  static const movingSoonBadge = 'individual.moving_soon_badge';
  static const volunteerMentorship = 'individual.volunteer_mentorship';
}
