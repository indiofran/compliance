class Attachment < ApplicationRecord
  belongs_to :person, optional: true
  belongs_to :attached_to_fruit, polymorphic: true, optional: true
  belongs_to :attached_to_seed, polymorphic: true, optional: true
  has_attached_file :document, optional: true

  after_commit :relate_to_person
  before_save :classify_type

  validates_attachment :document,
    content_type: {
      content_type: [
        'image/jpeg',
        'image/jpg',
        'image/gif',
        'image/png',
        'application/pdf',
        'application/zip',
        'application/x-rar-compressed'
    ]}

  validates_attachment_file_name :document, matches: [
    /png\z/,
    /jpg\z/,
    /jpeg\z/,
    /pdf\z/,
    /gif\z/,
    /zip\z/,
    /rar\z/,
  ]

  scope :fruit_orphan, -> { where('attached_to_seed_id is ? AND attached_to_fruit_id is ?', nil, nil).order(updated_at: :asc) }

  def document_url
    self.document.url
  end

  private
  def relate_to_person
    unless destroyed?
      self.update_column(:person_id, attached_to_seed.issue.person.id) if self.attached_to_seed_type
    end
  end

  def classify_type
    unless self.attached_to_seed_type.nil?
      self.attached_to_seed_type = self.attached_to_seed_type.camelize.singularize
    end 
  end
end
