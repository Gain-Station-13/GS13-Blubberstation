import {
  CheckboxInput,
  type Feature,
  type FeatureChoiced,
  type FeatureChoicedServerData,
  FeatureNumberInput,
  type FeatureNumeric,
  type FeatureToggle,
  FeatureTriBoolInput,
  FeatureTriColorInput,
  type FeatureValueProps,
} from '../../base';
import { FeatureDropdownInput } from '../../dropdowns';

export const feature_butt: Feature<string> = {
  name: 'Butt Choice',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>,
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const butt_skin_tone: FeatureToggle = {
  name: 'Butt uses Skin Tone',
  component: CheckboxInput,
};

export const butt_skin_color: FeatureToggle = {
  name: 'Butt uses Skin Color',
  component: CheckboxInput,
};

export const butt_color: Feature<string[]> = {
  name: 'Butt Color',
  component: FeatureTriColorInput,
};

export const butt_emissive: Feature<boolean[]> = {
  name: 'Butt Emissives',
  description: 'Emissive parts glow in the dark.',
  component: FeatureTriBoolInput,
};

export const butt_size: FeatureNumeric = {
  name: 'Butt Size',
  component: FeatureNumberInput,
};

export const feature_belly: Feature<string> = {
  name: 'Belly Choice',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>,
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const belly_size: FeatureNumeric = {
  name: 'Belly Size',
  component: FeatureNumberInput,
};

export const belly_skin_tone: FeatureToggle = {
  name: 'Belly uses Skin Tone',
  component: CheckboxInput,
};

export const belly_skin_color: FeatureToggle = {
  name: 'Belly uses Skin Color',
  component: CheckboxInput,
};

export const belly_color: Feature<string[]> = {
  name: 'Belly Color',
  component: FeatureTriColorInput,
};

export const belly_emissive: Feature<boolean[]> = {
  name: 'Belly Emissives',
  description: 'Emissive parts glow in the dark.',
  component: FeatureTriBoolInput,
};

export const erp_status_pref_feed: FeatureChoiced = {
  name: 'ERP Feeding Status',
  component: FeatureDropdownInput,
};

export const erp_status_pref_feed_nc: FeatureChoiced = {
  name: 'ERP Non-Con Feeding Status',
  component: FeatureDropdownInput,
};

export const erp_status_pref_muscle: FeatureChoiced = {
  name: 'ERP Muscle Gain Status',
  component: FeatureDropdownInput,
};

export const erp_status_pref_inflation: FeatureChoiced = {
  name: 'ERP Inflation Status',
  component: FeatureDropdownInput,
};

export const breast_produce: FeatureChoiced = {
  name: 'Breast produce',
  component: FeatureDropdownInput,
}

export const feature_anus: Feature<string> = {
  name: 'Anus Choice',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>,
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const anus_size: FeatureNumeric = {
  name: 'Anus Size',
  component: FeatureNumberInput,
};

export const anus_skin_tone: FeatureToggle = {
  name: 'Anus uses Skin Tone',
  component: CheckboxInput,
};

export const anus_skin_color: FeatureToggle = {
  name: 'Anus uses Skin Color',
  component: CheckboxInput,
};

export const anus_color: Feature<string[]> = {
  name: 'Anus Color',
  component: FeatureTriColorInput,
};

export const anus_emissive: Feature<boolean[]> = {
  name: 'Anus Emissives',
  description: 'Emissive parts glow in the dark.',
  component: FeatureTriBoolInput,
};


export const max_belly_size: FeatureNumeric = {
  name: 'Belly max size',
  component: FeatureNumberInput,
};

export const max_breast_size: FeatureNumeric = {
  name: 'Breasts max size',
  component: FeatureNumberInput,
};

export const max_butt_size: FeatureNumeric = {
  name: 'Butt max size',
  component: FeatureNumberInput,
};

export const max_anus_size: FeatureNumeric = {
  name: 'Anus max size',
  component: FeatureNumberInput,
};
