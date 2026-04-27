---
name: file-uploader
description: Carbon FileUploader — composite file-input pattern. Variants from Storybook — Default (label + button + selected list), FileUploaderItem (single row), FileUploaderDropContainer (96px dashed drop zone), DragAndDropUploadContainerExampleApplication (multi), DragAndDropUploadSingleContainerExampleApplication (single), Skeleton.
metadata:
  tags: file-uploader, file, upload, drag-drop, drop-zone, file-input, form, ibm, carbon, react, web-components
---

# File Uploader -- IBM Carbon Design System

> Source (verbatim Storybook code embedded below):
> - **React story:** [`FileUploader.stories.js`](https://github.com/carbon-design-system/carbon/blob/main/packages/react/src/components/FileUploader/FileUploader.stories.js)
> - **React drop-container helper (multi):** [`stories/drop-container.js`](https://github.com/carbon-design-system/carbon/blob/main/packages/react/src/components/FileUploader/stories/drop-container.js)
> - **React drop-container helper (single):** [`stories/drag-and-drop-single.js`](https://github.com/carbon-design-system/carbon/blob/main/packages/react/src/components/FileUploader/stories/drag-and-drop-single.js)
> - **WC story:** [`file-uploader.stories.ts`](https://github.com/carbon-design-system/carbon/blob/main/packages/web-components/src/components/file-uploader/file-uploader.stories.ts)
> - **SCSS:** [`_file-uploader.scss`](https://github.com/carbon-design-system/carbon/blob/main/packages/styles/scss/components/file-uploader/_file-uploader.scss)
> - **Storybook live (React):** https://react.carbondesignsystem.com/?path=/story/components-fileuploader--default
> - **Storybook live (WC):** https://web-components.carbondesignsystem.com/?path=/story/components-file-uploader--default
> - **Docs page:** https://v11.carbondesignsystem.com/components/file-uploader/usage/
> - **License:** Apache 2.0 — embedded source code is reproduced verbatim under that license

## Quick Reference

| Property | Value |
|---|---|
| Composition | `FileUploader` = `<label>` + `<helper>` + `<FileUploaderButton>` (or `<FileUploaderDropContainer>`) + selected-file list of `<FileUploaderItem>` rows |
| Drop container block-size | `96px` (`block-size: convert.to-rem(96px)`) |
| Drop container padding | `16px` (`spacing-05`) |
| Drop container border (rest) | `1px dashed var(--cds-border-strong)` |
| Drop container border (drag-over) | `outline: 2px solid var(--cds-focus); outline-offset: -2px; background: none;` |
| Drop container disabled border | `1px dashed var(--cds-button-disabled)` |
| Selected file row min-block-size (default / lg) | `48px` (`spacing-09`) |
| Selected file row min-block-size (md) | `40px` (`convert.to-rem(40px)`) |
| Selected file row min-block-size (sm) | `32px` (`convert.to-rem(32px)`) |
| Selected file row max-inline-size | `320px` (`convert.to-rem(320px)`) |
| Selected file gap (default / lg) | `12px 0` (`gap: convert.to-rem(12px) 0`) |
| Selected file gap (md) | `8px 0` (`spacing-03`) |
| Selected file gap (sm) | `4px 0` (`spacing-02`) |
| Filename margin-inline-start | `16px` (`spacing-05`) |
| Filename container max-inline-size (default) | `17.5rem` (280px) |
| Filename container max-inline-size (≤410px viewport) | `13.5rem` (216px) |
| Filename container max-inline-size (invalid) | `15.5rem` (248px) |
| State-container min-inline-size | `1.5rem` (24px) |
| State-container padding-inline-end | `12px` (`convert.to-rem(12px)`) |
| Loading / complete / close icon size | `1.5rem` (24px = `spacing-06`) |
| Invalid icon size | `1rem` (16px = `spacing-05`) |
| Invalid icon margin-inline-end | `8px` (`spacing-03`) |
| Browse button max-inline-size | `320px` (`convert.to-rem(320px)`) |
| Browse button outline (rest) | `2px solid transparent` |
| Browse button outline (focus / hover) | `2px solid var(--cds-focus)` |
| Browse button outline-offset | `-2px` |
| File label spacing-after | `8px` (`spacing-03`) — `margin-block-end` |
| Helper-text spacing-after | `16px` (`spacing-05`) — `margin-block-end` |
| Container spacing-before (after `<button>`) | `16px` (`spacing-05`) |
| Container spacing-before (after old `.cds--file-btn`) | `24px` (`spacing-06`) |
| Container spacing-before (file inside file) | `8px` (`spacing-03`) |
| Corner radius | `0` (Carbon: sharp by default — drop container, file rows, and icons all square) |
| Drop container background (White) | transparent over `--cds-background` `#ffffff` |
| Drop container border-strong (White) | `#8d8d8d` (`--cds-border-strong-01`) |
| Drop container background (G100) | transparent over `--cds-background` `#161616` |
| Drop container border-strong (G100) | `#6f6f6f` (`--cds-border-strong-01`) |
| Selected-file row background (White) | `#f4f4f4` (`--cds-layer-01` resolved from `$layer`) |
| Selected-file row background (G100) | `#262626` (`--cds-layer-01` resolved from `$layer`) |
| Filename text color (White / G100) | `#161616` / `#f4f4f4` (`--cds-text-primary`) |
| File label color (White / G100) | `#161616` / `#f4f4f4` (`--cds-text-primary`) |
| Helper / label-description color (White / G100) | `#525252` / `#c6c6c6` (`--cds-text-secondary`) |
| Disabled label / helper / browse-btn color (White) | `rgba(22, 22, 22, 0.25)` (`--cds-text-disabled`) |
| Disabled label / helper / browse-btn color (G100) | `rgba(244, 244, 244, 0.25)` (`--cds-text-disabled`) |
| Browse-btn link color (White / G100) | `#0f62fe` / `#78a9ff` (`--cds-link-primary`) |
| Browse-btn active color | `--cds-text-primary` (`#161616` / `#f4f4f4`) |
| Loading svg stroke color | `--cds-icon-primary` (`#161616` / `#f4f4f4`) |
| Complete checkmark fill | `--cds-interactive` (`#0f62fe` / `#4589ff`) |
| Complete checkmark inner-path | `--cds-icon-inverse` (`#ffffff` / `#161616`) |
| Invalid (error) icon fill | `--cds-support-error` (`#da1e28` / `#fa4d56`) |
| Close icon fill | `--cds-icon-primary` (`#161616` / `#f4f4f4`) |
| Invalid form-requirement title color | `--cds-text-error` (`#da1e28` / `#ff8389`) |
| Invalid form-requirement supplement color | `--cds-text-primary` |
| Invalid border-block-start (between filename & error) | `1px solid var(--cds-border-subtle)` |
| Invalid focus outline | `@focus-outline('invalid')` — `outline: 1px solid var(--cds-support-error); outline-offset: -1px` |
| Browse-btn transition | `transition: var(--cds-duration-fast-02) var(--cds-easing-productive-standard)` |
| Focus ring (close button) | `@focus-outline('outline')` — 2px solid var(--cds-focus), inset 0 0 0 1px var(--cds-background) |
| Focus ring (complete button) | `@focus-outline('border')` — 1px solid var(--cds-focus) |
| Font (label) | IBM Plex Sans, `heading-compact-01` |
| Font (helper / label-description) | IBM Plex Sans, `body-compact-01` |
| Font (filename / drop-container text / filename-button) | IBM Plex Sans, `body-compact-01` |
| Font (form-requirement title / supplement) | IBM Plex Sans, `helper-text-01` |
| File-input itself | `@visually-hidden` — never visible; clicked through label/button |
| React import | `import { FileUploader, FileUploaderButton, FileUploaderDropContainer, FileUploaderItem, FileUploaderSkeleton } from '@carbon/react';` |
| WC import | `import '@carbon/web-components/es/components/file-uploader/index.js';` |

## Variants (from Storybook story exports)

| Variant | Story export | Source file | Purpose |
|---|---|---|---|
| Default | `Default` | `FileUploader.stories.js` | Full composite — label, helper, primary `Add file` button, then selected-file list as files arrive. Uses `<FileUploader>` parent. |
| FileUploaderItem | `_FileUploaderItem` | `FileUploader.stories.js` | A single selected-file row in isolation — useful for showing all three statuses (`uploading` / `edit` / `complete`) and the `invalid` flag (with `errorSubject` + `errorBody`). |
| FileUploaderDropContainer | `_FileUploaderDropContainer` | `FileUploader.stories.js` | The 96px dashed drop zone in isolation — `labelText`, `multiple`, `maxFileSize`, `accept`. |
| DragAndDropUploadContainerExampleApplication | `DragAndDropUploadContainerExampleApplication` | `FileUploader.stories.js` (renders `stories/drop-container.js`) | Wired-up multi-file demo: drop zone above + uploaded list below, with simulated upload progress, size validation (`> 512000` bytes triggers error), and per-row delete. |
| DragAndDropUploadSingleContainerExampleApplication | `DragAndDropUploadSingleContainerExampleApplication` | `FileUploader.stories.js` (renders `stories/drag-and-drop-single.js`) | Same as above but `multiple={false}` — drop zone disappears once a file is selected, reappears on delete. |
| Skeleton | `Skeleton` | `FileUploader.stories.js` | `<FileUploaderSkeleton>` placeholder while content loads (wrapped to 500px). |
| WC: Default | `Default` | `file-uploader.stories.ts` | `<cds-file-uploader>` parent + `<cds-file-uploader-button>` slot, controllable `input-state` (`uploading` / `edit` / `complete`). |
| WC: FileUploaderItem | `FileUploaderItem` | `file-uploader.stories.ts` | Single `<cds-file-uploader-item state="edit">README.md</cds-file-uploader-item>`. |
| WC: FileUploaderDropContainer | `FileUploaderDropContainer` | `file-uploader.stories.ts` | `<cds-file-uploader-drop-container multiple accept="image/jpeg image/png">` slotted into `<cds-file-uploader>`. |
| WC: DragAndDropUploadContainerExampleApplication | `DragAndDropUploadContainerExampleApplication` | `file-uploader.stories.ts` | Multi-file drop container example. |
| WC: DragAndDropUploadSingleContainerExampleApplication | `DragAndDropUploadSingleContainerExampleApplication` | `file-uploader.stories.ts` | Single-file drop container example. |
| WC: Skeleton | `Skeleton` | `file-uploader.stories.ts` | `<cds-file-uploader-skeleton>`. |

The `_FileUploaderItem` story export name is prefixed with `_` because Storybook's CSF treats reserved/duplicate component names — the Story renders as the public name `FileUploaderItem`. Same for `_FileUploaderDropContainer`. The `Default` and `Skeleton` stories live on the parent `FileUploader` component meta.

Per the React story controls:
- `buttonKind` options: `primary`, `secondary`, `danger`, `ghost`, `danger--primary`, `tertiary`
- `filenameStatus` options: `edit`, `complete`, `uploading`
- `size` options: `sm`, `md`, `lg`
- `accept` default: `['.jpg', '.png']`; `maxFileSize` default: `1024 * 1024` (1 MB)

## React (verbatim from Storybook)

> The code blocks below are copied exactly from `FileUploader.stories.js`, `stories/drop-container.js`, and `stories/drag-and-drop-single.js` on the Carbon `main` branch. Do NOT edit them — the Carbon source is the truth. The agent should output these as-is when generating Carbon UI.

**Imports** (from the top of `FileUploader.stories.js`):

```jsx
import React from 'react';
import ExampleDropContainerApp from './stories/drop-container';
import ExampleDropContainerAppSingle from './stories/drag-and-drop-single';
import mdx from './FileUploader.mdx';

import {
  default as FileUploader,
  FileUploaderButton,
  FileUploaderDropContainer,
  FileUploaderItem,
  FileUploaderSkeleton,
} from './';

const filenameStatuses = ['edit', 'complete', 'uploading'];
```

**Default args** (apply to the `Default` story unless overridden):

```jsx
Default.args = {
  labelTitle: 'Upload files',
  labelDescription: 'Max file size is 1 MB. Only .jpg files are supported.',
  buttonLabel: 'Add file',
  buttonKind: 'primary',
  size: 'md',
  filenameStatus: 'edit',
  accept: ['.jpg', '.png'],
  multiple: true,
  maxFileSize: 1024 * 1024,
  disabled: false,
  iconDescription: 'Delete file',
  name: '',
};
```

**Variant: Default**

```jsx
export const Default = (args) => {
  return (
    <div className="cds--file__container">
      <FileUploader {...args} />
    </div>
  );
};
```

**Variant: FileUploaderItem (`_FileUploaderItem`)**

```jsx
export const _FileUploaderItem = (args) => {
  return (
    <FileUploaderItem
      errorBody="1 MB max file size. Select a new file and try again."
      errorSubject="File size exceeds limit"
      iconDescription="Delete file"
      invalid={false}
      name="THIS IS A VERY LONG FILENAME WHICH WILL BE TRUNCATED"
      status="edit"
      size="md"
      {...args}
    />
  );
};
```

**Variant: FileUploaderDropContainer (`_FileUploaderDropContainer`)**

```jsx
export const _FileUploaderDropContainer = () => {
  return (
    <FileUploaderDropContainer
      labelText="Drag and drop files here or click to upload"
      multiple={true}
      maxFileSize={1024 * 1024}
      accept={['image/jpeg', 'image/png']}
      disabled={false}
      name=""
    />
  );
};
```

**Variant: DragAndDropUploadContainerExampleApplication**

```jsx
export const DragAndDropUploadContainerExampleApplication = (args) =>
  ExampleDropContainerApp(args);

DragAndDropUploadContainerExampleApplication.args = {
  labelText: 'Drag and drop files here or click to upload',
  name: '',
  multiple: true,
  maxFileSize: 1024 * 1024,
  accept: ['image/jpeg', 'image/png'],
  disabled: false,
  tabIndex: 0,
};
DragAndDropUploadContainerExampleApplication.argTypes = {
  onChange: { action: 'onChange' },
};
```

The `ExampleDropContainerApp` referenced above is defined verbatim in `stories/drop-container.js`:

```jsx
import React, { useState, useCallback, useEffect, useRef } from 'react';
import classnames from 'classnames';
import FileUploaderItem from '../FileUploaderItem';
import FileUploaderDropContainer from '../FileUploaderDropContainer';
import FormItem from '../../FormItem';
import { useId } from '../../../internal/useId';

const prefix = 'cds';

const ExampleDropContainerApp = (props) => {
  const [files, setFiles] = useState([]);
  const uploaderButton = useRef(null);
  const uniqueId = useId();
  const handleDrop = (e) => {
    e.preventDefault();
  };

  const handleDragover = (e) => {
    e.preventDefault();
  };

  useEffect(() => {
    document.addEventListener('drop', handleDrop);
    document.addEventListener('dragover', handleDragover);
    return () => {
      document.removeEventListener('drop', handleDrop);
      document.removeEventListener('dragover', handleDragover);
    };
  }, []);

  const uploadFile = async (fileToUpload) => {
    // file size validation
    if (fileToUpload.filesize > 512000) {
      const updatedFile = {
        ...fileToUpload,
        status: 'edit',
        iconDescription: 'Delete file',
        invalid: true,
        errorSubject: 'File size exceeds limit',
        errorBody: '1 MB max file size. Select a new file and try again.',
      };
      setFiles((files) =>
        files.map((file) =>
          file.uuid === fileToUpload.uuid ? updatedFile : file
        )
      );
      return;
    }

    // file type validation
    if (fileToUpload.invalidFileType) {
      const updatedFile = {
        ...fileToUpload,
        status: 'edit',
        iconDescription: 'Delete file',
        invalid: true,
        errorSubject: 'Invalid file type',
        errorBody: `"${fileToUpload.name}" does not have a valid file type.`,
      };
      setFiles((files) =>
        files.map((file) =>
          file.uuid === fileToUpload.uuid ? updatedFile : file
        )
      );
      return;
    }

    // simulate network request time
    const rand = Math.random() * 1000;
    setTimeout(() => {
      const updatedFile = {
        ...fileToUpload,
        status: 'complete',
        iconDescription: 'Upload complete',
      };
      setFiles((files) =>
        files.map((file) =>
          file.uuid === fileToUpload.uuid ? updatedFile : file
        )
      );
    }, rand);

    // show x icon after 1 second
    setTimeout(() => {
      const updatedFile = {
        ...fileToUpload,
        status: 'edit',
        iconDescription: 'Delete file',
      };
      setFiles((files) =>
        files.map((file) =>
          file.uuid === fileToUpload.uuid ? updatedFile : file
        )
      );
    }, rand + 1000);
  };

  const onAddFiles = useCallback(
    (evt, { addedFiles }) => {
      evt.stopPropagation();
      const newFiles = addedFiles.map((file) => ({
        uuid: uniqueId + file.name + file.size,
        name: file.name,
        filesize: file.size,
        status: 'uploading',
        iconDescription: 'Uploading',
        invalidFileType: file.invalidFileType,
      }));
      // eslint-disable-next-line react/prop-types
      if (props.multiple) {
        setFiles([...files, ...newFiles]);
        newFiles.forEach(uploadFile);
      } else if (newFiles[0]) {
        setFiles([newFiles[0]]);
        uploadFile(newFiles[0]);
      }
    },
    // eslint-disable-next-line react/prop-types
    [files, props.multiple]
  );

  const handleFileUploaderItemClick = useCallback(
    (_, { uuid: clickedUuid }) => {
      uploaderButton.current.focus();
      return setFiles(files.filter(({ uuid }) => clickedUuid !== uuid));
    },
    [files]
  );

  const labelClasses = classnames(`${prefix}--file--label`, {
    // eslint-disable-next-line react/prop-types
    [`${prefix}--file--label--disabled`]: props.disabled,
  });

  const helperTextClasses = classnames(`${prefix}--label-description`, {
    // eslint-disable-next-line react/prop-types
    [`${prefix}--label-description--disabled`]: props.disabled,
  });

  return (
    <FormItem>
      <p className={labelClasses}>Upload files</p>
      <p className={helperTextClasses}>
        Max file size is 1 MB. Supported file types are .jpg and .png.
      </p>
      <FileUploaderDropContainer
        {...props}
        onAddFiles={onAddFiles}
        innerRef={uploaderButton}
      />
      <div
        className={classnames(
          `${prefix}--file-container`,
          `${prefix}--file-container--drop`
        )}>
        {files.map(
          ({
            uuid,
            name,
            filesize,
            status,
            iconDescription,
            invalid,
            ...rest
          }) => (
            <FileUploaderItem
              key={uuid}
              uuid={uuid}
              name={name}
              filesize={filesize}
              // eslint-disable-next-line react/prop-types
              size={props.size}
              status={status}
              iconDescription={iconDescription}
              invalid={invalid}
              onDelete={handleFileUploaderItemClick}
              {...rest}
            />
          )
        )}
      </div>
    </FormItem>
  );
};

export default ExampleDropContainerApp;
```

**Variant: DragAndDropUploadSingleContainerExampleApplication**

```jsx
export const DragAndDropUploadSingleContainerExampleApplication = (args) =>
  ExampleDropContainerAppSingle(args);

DragAndDropUploadSingleContainerExampleApplication.args = {
  labelText: 'Drag and drop a file here or click to upload',
  name: '',
  multiple: false,
  maxFileSize: 1024 * 1024,
  accept: ['image/jpeg', 'image/png'],
  disabled: false,
  tabIndex: 0,
};
DragAndDropUploadSingleContainerExampleApplication.argTypes = {
  onChange: { action: 'onChange' },
};
```

The `ExampleDropContainerAppSingle` referenced above is defined verbatim in `stories/drag-and-drop-single.js`:

```jsx
import React, { useState, useEffect, useRef } from 'react';
import classnames from 'classnames';
import FileUploaderItem from '../FileUploaderItem';
import FileUploaderDropContainer from '../FileUploaderDropContainer';
import FormItem from '../../FormItem';
import { useId } from '../../../internal/useId';

const prefix = 'cds';

const ExampleDropContainerApp = (props) => {
  const [file, setFile] = useState();
  const uploaderButton = useRef(null);
  const uniqueId = useId();
  const handleDrop = (e) => {
    e.preventDefault();
  };

  const handleDragover = (e) => {
    e.preventDefault();
  };

  useEffect(() => {
    document.addEventListener('drop', handleDrop);
    document.addEventListener('dragover', handleDragover);
    return () => {
      document.removeEventListener('drop', handleDrop);
      document.removeEventListener('dragover', handleDragover);
    };
  }, []);

  const uploadFile = async (fileToUpload) => {
    // file size validation
    if (fileToUpload[0].filesize > 512000) {
      const updatedFile = {
        ...fileToUpload[0],
        status: 'edit',
        iconDescription: 'Delete file',
        invalid: true,
        errorSubject: 'File size exceeds limit',
        errorBody: '1 MB max file size. Select a new file and try again.',
      };
      setFile(updatedFile);
      return;
    }

    // file type validation
    if (fileToUpload.invalidFileType) {
      const updatedFile = {
        ...fileToUpload[0],
        status: 'edit',
        iconDescription: 'Delete file',
        invalid: true,
        errorSubject: 'Invalid file type',
        errorBody: `"${fileToUpload.name}" does not have a valid file type.`,
      };
      setFile(updatedFile);
      return;
    }

    // simulate network request time
    const rand = Math.random() * 1000;
    setTimeout(() => {
      const updatedFile = {
        ...fileToUpload[0],
        status: 'complete',
        iconDescription: 'Upload complete',
      };
      setFile(updatedFile);
    }, rand);

    // show x icon after 1 second
    setTimeout(() => {
      const updatedFile = {
        ...fileToUpload[0],
        status: 'edit',
        iconDescription: 'Delete file',
      };
      setFile(updatedFile);
    }, rand + 1000);
  };

  const onAddFilesButton = (event, { addedFiles }) => {
    const file = addedFiles;

    const newFile = [
      {
        uuid: uniqueId + file[0].name + file[0].size,
        name: file[0].name,
        filesize: file[0].size,
        status: 'uploading',
        iconDescription: 'Uploading',
        invalidFileType: file[0].invalidFileType,
      },
    ];

    setFile(newFile[0]);
    uploadFile([newFile[0]]);
  };

  const handleFileUploaderItemClick = () => {
    setFile();
  };

  const labelClasses = classnames(`${prefix}--file--label`, {
    // eslint-disable-next-line react/prop-types
    [`${prefix}--file--label--disabled`]: props.disabled,
  });

  const helperTextClasses = classnames(`${prefix}--label-description`, {
    // eslint-disable-next-line react/prop-types
    [`${prefix}--label-description--disabled`]: props.disabled,
  });

  return (
    <FormItem>
      <p className={labelClasses}>Upload files</p>
      <p className={helperTextClasses}>
        Max file size is 500kb. Supported file types are .jpg and .png.
      </p>
      {file === undefined && (
        <FileUploaderDropContainer
          {...props}
          onAddFiles={onAddFilesButton}
          innerRef={uploaderButton}
        />
      )}

      <div
        className={classnames(
          `${prefix}--file-container`,
          `${prefix}--file-container--drop`
        )}>
        {file !== undefined && (
          <FileUploaderItem
            key={file.uuid}
            uuid={file.uuid}
            name={file.name}
            filesize={file.filesize}
            errorSubject="File size exceeds limit"
            errorBody="1 MB max file size. Select a new file and try again."
            // eslint-disable-next-line react/prop-types
            size={props.size}
            status={file.status}
            iconDescription={file.iconDescription}
            invalid={file.invalid}
            onDelete={handleFileUploaderItemClick}
            onAddFiles={onAddFilesButton}
          />
        )}
      </div>
    </FormItem>
  );
};

export default ExampleDropContainerApp;
```

**Variant: Skeleton**

```jsx
export const Skeleton = () => {
  return (
    <div style={{ width: '500px' }}>
      <FileUploaderSkeleton />
    </div>
  );
};
```

**Story argTypes** (control surface for the `Default` story):

```jsx
Default.argTypes = {
  onChange: { action: 'onChange' },
  onClick: { action: 'onClick' },
  onDelete: { action: 'onDelete' },
  buttonKind: {
    control: { type: 'select' },
    options: [
      'primary',
      'secondary',
      'danger',
      'ghost',
      'danger--primary',
      'tertiary',
    ],
  },
  filenameStatus: {
    control: { type: 'select' },
    options: filenameStatuses,
  },
  size: {
    control: { type: 'select' },
    options: ['sm', 'md', 'lg'],
  },
};

Default.parameters = {
  controls: { exclude: ['accept', 'role'] },
};
```

**Item argTypes** (control surface for the `_FileUploaderItem` story):

```jsx
_FileUploaderItem.argTypes = {
  errorBody: {
    control: 'text',
    description: 'Error message body for an invalid file upload',
  },
  errorSubject: {
    control: 'text',
    description: 'Error message subject for an invalid file upload',
  },
  iconDescription: { control: 'text' },
  invalid: {
    control: 'boolean',
    description: 'Specify if the currently uploaded file is invalid',
  },
  name: { control: 'text', description: 'Name of the uploaded file' },
  onDelete: { action: 'onDelete' },
  size: { control: 'select', options: ['sm', 'md', 'lg'] },
  status: {
    control: 'inline-radio',
    options: ['uploading', 'edit', 'complete'],
    description: 'Status of the file upload',
  },
  uuid: {
    control: 'text',
    description: 'Unique identifier for the file object',
  },
};

// Remove all the props that don't apply to FileUploaderItem
_FileUploaderItem.parameters = {
  controls: {
    exclude: [
      'accept',
      'buttonKind',
      'buttonLabel',
      'disabled',
      'labelDescription',
      'labelTitle',
      'multiple',
      'filenameStatus',
    ],
  },
};
```

**Default export** (Storybook meta — defines `subcomponents` so the FileUploader story page surfaces every primitive in one place):

```jsx
export default {
  title: 'Components/FileUploader',
  component: FileUploader,
  subcomponents: {
    FileUploaderButton,
    FileUploaderSkeleton,
    FileUploaderItem,
    FileUploaderDropContainer,
  },
  parameters: {
    docs: {
      page: mdx,
    },
  },
};
```

## Web Components (verbatim from Storybook)

> The code blocks below are copied exactly from `file-uploader.stories.ts` on the Carbon `main` branch. Use these for non-React projects.

**Imports** (from the top of `file-uploader.stories.ts`):

```ts
import { html } from 'lit';
import { ifDefined } from 'lit/directives/if-defined.js';
import { prefix } from '../../globals/settings';
import './index';
import { FILE_UPLOADER_ITEM_STATE } from './file-uploader-item';
import { BUTTON_KIND, BUTTON_SIZE } from '../button/button';
```

**Args / argTypes maps** (referenced by every story render below):

```ts
const kind = {
  [`Primary button (${BUTTON_KIND.PRIMARY})`]: BUTTON_KIND.PRIMARY,
  [`Secondary button (${BUTTON_KIND.SECONDARY})`]: BUTTON_KIND.SECONDARY,
  [`Tertiary button (${BUTTON_KIND.TERTIARY})`]: BUTTON_KIND.TERTIARY,
  [`Danger primary button (${BUTTON_KIND.DANGER_PRIMARY})`]:
    BUTTON_KIND.DANGER_PRIMARY,
  [`Danger button (${BUTTON_KIND.DANGER})`]: BUTTON_KIND.DANGER,
  [`Ghost button (${BUTTON_KIND.GHOST})`]: BUTTON_KIND.GHOST,
};

const states = {
  [`Upload in progress (${FILE_UPLOADER_ITEM_STATE.UPLOADING})`]:
    FILE_UPLOADER_ITEM_STATE.UPLOADING,
  [`Upload complete (${FILE_UPLOADER_ITEM_STATE.COMPLETE})`]:
    FILE_UPLOADER_ITEM_STATE.COMPLETE,
  [`Edit upload (${FILE_UPLOADER_ITEM_STATE.EDIT})`]:
    FILE_UPLOADER_ITEM_STATE.EDIT,
};

const sizes = {
  [`sm (${BUTTON_SIZE.SMALL})`]: BUTTON_SIZE.SMALL,
  [`md (${BUTTON_SIZE.MEDIUM})`]: BUTTON_SIZE.MEDIUM,
  [`lg (${BUTTON_SIZE.LARGE})`]: BUTTON_SIZE.LARGE,
};

const args = {
  buttonKind: BUTTON_KIND.PRIMARY,
  buttonLabel: 'Add file',
  disabled: false,
  state: FILE_UPLOADER_ITEM_STATE.UPLOADING,
  iconDescription: 'Delete file',
  labelDescription: 'Max file size is 500kb. Only .jpg files are supported.',
  labelTitle: 'Upload files',
  name: '',
  multiple: false,
  size: BUTTON_SIZE.MEDIUM,
};

const argTypes = {
  buttonKind: {
    control: 'select',
    options: kind,
    description:
      'Specify the types of files that this input should be able to receive.',
  },
  buttonLabel: {
    control: 'text',
    description:
      'Provide the label text to be read by screen readers when interacting with the <code>&lt;cds-file-uploader-button&gt;</code>.',
  },
  disabled: {
    control: 'boolean',
    description: 'Specify whether file input is disabled.',
  },
  state: {
    control: 'select',
    description: 'File uploader item state (state)',
    options: states,
  },
  iconDescription: {
    control: 'text',
    description:
      'Provide a description for the complete/close icon that can be read by screen readers.',
  },
  labelDescription: {
    control: 'text',
    description:
      'Specify the description text of this <code>&lt;cds-file-uploader&gt;</code>.',
  },
  labelTitle: {
    control: 'text',
    description:
      'Specify the title text of this <code>&lt;cds-file-uploader&gt;</code>.',
  },
  name: {
    control: 'text',
    description:
      'Provide a name for the underlying <code>&lt;input&gt;</code> node.',
  },
  multiple: {
    control: 'boolean',
    description:
      'Specify if the component should accept multiple files to upload.',
  },
  size: {
    control: 'select',
    description:
      'Specify the size of the <code>&lt;cds-file-uploader-button&gt;</code>, from a list of available sizes.',
    options: sizes,
  },
  onDelete: {
    action: `${prefix}-file-uploader-item-deleted`,
  },
  onChange: {
    action: `${prefix}-drop-container-changed`,
  },
};
```

**Variant: Default**

```ts
export const Default = {
  args,
  argTypes,
  render: (args) => {
    const {
      buttonKind,
      buttonLabel,
      disabled,
      state,
      iconDescription,
      labelDescription,
      labelTitle,
      multiple,
      onDelete,
      onChange,
      name,
      size,
    } = args ?? {};

    return html`
      <cds-file-uploader
        label-title="${labelTitle}"
        label-description="${labelDescription}"
        ?multiple="${multiple}"
        input-state="${state}"
        ?disabled="${disabled}"
        icon-description="${iconDescription}"
        @cds-file-uploader-item-deleted="${onDelete}"
        @cds-file-uploader-drop-container-changed="${onChange}"
        input-name="${ifDefined(name)}">
        <cds-file-uploader-button
          button-kind="${buttonKind}"
          accept="image/jpeg"
          name="default-file-uploader-button"
          size="${ifDefined(size)}">
          ${buttonLabel}
        </cds-file-uploader-button>
      </cds-file-uploader>
    `;
  },
};
```

**Variant: DragAndDropUploadContainerExampleApplication**

```ts
export const DragAndDropUploadContainerExampleApplication = {
  render: () => {
    return html`
      <cds-file-uploader
        label-title="Upload files"
        label-description="Max file size is 1 MB. Supported file types are .jpg and .png."
        multiple>
        <cds-file-uploader-drop-container accept="image/jpeg image/png">
          Drag and drop files here or click to upload
        </cds-file-uploader-drop-container>
      </cds-file-uploader>
    `;
  },
};
```

**Variant: DragAndDropUploadSingleContainerExampleApplication**

```ts
export const DragAndDropUploadSingleContainerExampleApplication = {
  render: () => {
    return html`
      <cds-file-uploader
        label-title="Upload a file"
        label-description="Max file size is 1 MB. Only .jpg files are supported.">
        <cds-file-uploader-drop-container accept="image/jpeg">
          Drag and drop a file here or click to upload
        </cds-file-uploader-drop-container>
      </cds-file-uploader>
    `;
  },
};
```

**Variant: FileUploaderDropContainer**

```ts
export const FileUploaderDropContainer = {
  render: () => {
    return html`
      <cds-file-uploader>
        <cds-file-uploader-drop-container
          multiple
          accept="image/jpeg image/png">
          Drag and drop files here or click to upload
        </cds-file-uploader-drop-container>
      </cds-file-uploader>
    `;
  },
};
```

**Variant: FileUploaderItem**

```ts
export const FileUploaderItem = {
  render: () => {
    return html`
      <cds-file-uploader-item state="${FILE_UPLOADER_ITEM_STATE.EDIT}">
        README.md
      </cds-file-uploader-item>
    `;
  },
};
```

**Variant: Skeleton**

```ts
export const Skeleton = {
  render: () => {
    return html` <cds-file-uploader-skeleton></cds-file-uploader-skeleton> `;
  },
};
```

**Default export** (Storybook meta):

```ts
const meta = {
  title: 'Components/File uploader',
};

export default meta;
```

## Plain HTML (derived from Web Components)

> The same markup as the WC section, with lit-html bindings (e.g., `?multiple="${multiple}"` → `multiple` or removed) resolved to static attributes. Use this for hand-coded HTML without a component framework. Class names below match the SCSS in `_file-uploader.scss` so the styles will apply identically once `@carbon/styles` is loaded.

**Variant: Default (button + label + helper, no selected files yet)**

```html
<cds-file-uploader
  label-title="Upload files"
  label-description="Max file size is 500kb. Only .jpg files are supported."
  input-state="uploading"
  icon-description="Delete file"
  input-name="">
  <cds-file-uploader-button
    button-kind="primary"
    accept="image/jpeg"
    name="default-file-uploader-button"
    size="md">
    Add file
  </cds-file-uploader-button>
</cds-file-uploader>
```

**Variant: FileUploaderItem (single row, edit state)**

```html
<cds-file-uploader-item state="edit">
  README.md
</cds-file-uploader-item>
```

**Variant: FileUploaderDropContainer (96px dashed drop zone)**

```html
<cds-file-uploader>
  <cds-file-uploader-drop-container
    multiple
    accept="image/jpeg image/png">
    Drag and drop files here or click to upload
  </cds-file-uploader-drop-container>
</cds-file-uploader>
```

**Variant: DragAndDropUploadContainerExampleApplication (multi)**

```html
<cds-file-uploader
  label-title="Upload files"
  label-description="Max file size is 1 MB. Supported file types are .jpg and .png."
  multiple>
  <cds-file-uploader-drop-container accept="image/jpeg image/png">
    Drag and drop files here or click to upload
  </cds-file-uploader-drop-container>
</cds-file-uploader>
```

**Variant: DragAndDropUploadSingleContainerExampleApplication (single)**

```html
<cds-file-uploader
  label-title="Upload a file"
  label-description="Max file size is 1 MB. Only .jpg files are supported.">
  <cds-file-uploader-drop-container accept="image/jpeg">
    Drag and drop a file here or click to upload
  </cds-file-uploader-drop-container>
</cds-file-uploader>
```

**Variant: Skeleton**

```html
<cds-file-uploader-skeleton></cds-file-uploader-skeleton>
```

**Bare-class fallback** (matches the SCSS class names directly — useful when not loading the WC custom-element bundle, e.g., for a hand-coded React/Vue/Svelte rewrite using the same Carbon stylesheet):

```html
<!-- Composite: label + helper + browse-style drop zone + selected-file list -->
<div class="cds--file">
  <p class="cds--file--label">Upload files</p>
  <p class="cds--label-description">
    Max file size is 1 MB. Only .jpg files are supported.
  </p>

  <!-- Visually hidden native input — clicked through the drop container -->
  <input
    class="cds--file-input"
    type="file"
    id="file-uploader-input-1"
    accept=".jpg,.png"
    multiple />

  <!-- Browse-link style "select file" UI (preferred) -->
  <label
    for="file-uploader-input-1"
    class="cds--file-browse-btn"
    role="button"
    tabindex="0">
    <div class="cds--file__drop-container">
      Drag and drop files here or click to upload
    </div>
  </label>

  <!-- Selected file list -->
  <div class="cds--file-container cds--file-container--drop">

    <!-- Row, default size, status: uploading (inline loading spinner) -->
    <span class="cds--file__selected-file">
      <p class="cds--file-filename" title="document.jpg">document.jpg</p>
      <span class="cds--file__state-container">
        <div class="cds--inline-loading__animation">
          <div data-floating-menu-container class="cds--loading cds--loading--small">
            <svg class="cds--loading__svg" viewBox="-75 -75 150 150">
              <circle class="cds--loading__stroke" cx="0" cy="0" r="37.5" />
            </svg>
          </div>
        </div>
      </span>
    </span>

    <!-- Row, default size, status: complete (filled checkmark) -->
    <span class="cds--file__selected-file">
      <p class="cds--file-filename" title="photo.png">photo.png</p>
      <span class="cds--file__state-container">
        <button
          type="button"
          class="cds--file-complete"
          aria-label="Upload complete">
          <svg
            focusable="false"
            preserveAspectRatio="xMidYMid meet"
            xmlns="http://www.w3.org/2000/svg"
            width="16" height="16" viewBox="0 0 16 16"
            aria-hidden="true">
            <path d="M8,1C4.2,1,1,4.2,1,8s3.2,7,7,7s7-3.1,7-7S11.9,1,8,1z M7,11L4.3,8.3l0.9-0.8L7,9.3l3.756-3.659l0.937,0.762L7,11z"></path>
            <path
              data-icon-path="inner-path"
              opacity="0"
              d="M7,11L4.3,8.3l0.9-0.8L7,9.3l3.756-3.659l0.937,0.762L7,11z"></path>
          </svg>
        </button>
      </span>
    </span>

    <!-- Row, default size, status: edit (close × to remove) -->
    <span class="cds--file__selected-file">
      <p class="cds--file-filename" title="notes.jpg">notes.jpg</p>
      <span class="cds--file__state-container">
        <button
          type="button"
          aria-label="Delete file"
          class="cds--file-close">
          <svg
            focusable="false"
            preserveAspectRatio="xMidYMid meet"
            xmlns="http://www.w3.org/2000/svg"
            width="16" height="16" viewBox="0 0 32 32"
            aria-hidden="true">
            <path d="M24 9.4L22.6 8 16 14.6 9.4 8 8 9.4 14.6 16 8 22.6 9.4 24 16 17.4 22.6 24 24 22.6 17.4 16 24 9.4z"></path>
          </svg>
        </button>
      </span>
    </span>

    <!-- Row, invalid: error icon + form-requirement title + supplement -->
    <span class="cds--file__selected-file cds--file__selected-file--invalid">
      <svg
        focusable="false"
        preserveAspectRatio="xMidYMid meet"
        xmlns="http://www.w3.org/2000/svg"
        class="cds--file-invalid"
        width="16" height="16" viewBox="0 0 16 16"
        aria-hidden="true">
        <path d="M8,1C4.2,1,1,4.2,1,8s3.2,7,7,7s7-3.1,7-7S11.9,1,8,1z M7.5,4h1v5h-1C7.5,9,7.5,4,7.5,4z M8,12.2 c-0.4,0-0.8-0.4-0.8-0.8s0.3-0.8,0.8-0.8c0.4,0,0.8,0.4,0.8,0.8S8.4,12.2,8,12.2z"></path>
      </svg>
      <p class="cds--file-filename" title="oversize.jpg">oversize.jpg</p>
      <span class="cds--file__state-container">
        <button
          type="button"
          aria-label="Delete file"
          class="cds--file-close">
          <svg width="16" height="16" viewBox="0 0 32 32" aria-hidden="true">
            <path d="M24 9.4L22.6 8 16 14.6 9.4 8 8 9.4 14.6 16 8 22.6 9.4 24 16 17.4 22.6 24 24 22.6 17.4 16 24 9.4z"></path>
          </svg>
        </button>
      </span>
      <div class="cds--form-requirement">
        <div class="cds--form-requirement__title">File size exceeds limit</div>
        <p class="cds--form-requirement__supplement">
          1 MB max file size. Select a new file and try again.
        </p>
      </div>
    </span>
  </div>
</div>
```

## Design Tokens (component-scoped)

> Resolved literally from `overview.md` for the White and G100 themes. The Storybook source uses Carbon's semantic tokens (`$layer`, `$text-primary`, `$border-strong`, etc.); the values below are what those resolve to per theme. The `.dark` block mirrors `[data-theme="g100"]`.

```css
[data-theme="white"] {
  /* Drop container */
  --cds-file-uploader-drop-bg: transparent;            /* over --cds-background #ffffff */
  --cds-file-uploader-drop-border: #8d8d8d;            /* --cds-border-strong-01 (Carbon $border-strong) */
  --cds-file-uploader-drop-border-disabled: #c6c6c6;   /* --cds-button-disabled */
  --cds-file-uploader-drop-focus: #0f62fe;             /* --cds-focus */

  /* Browse-link button */
  --cds-file-uploader-browse-color: #0f62fe;           /* --cds-link-primary */
  --cds-file-uploader-browse-active-color: #161616;    /* --cds-text-primary */
  --cds-file-uploader-browse-disabled-color: rgba(22, 22, 22, 0.25); /* --cds-text-disabled */

  /* Label / helper */
  --cds-file-uploader-label-color: #161616;            /* --cds-text-primary */
  --cds-file-uploader-label-disabled: rgba(22, 22, 22, 0.25); /* --cds-text-disabled */
  --cds-file-uploader-helper-color: #525252;           /* --cds-text-secondary */
  --cds-file-uploader-helper-disabled: rgba(22, 22, 22, 0.25);

  /* Selected file row */
  --cds-file-uploader-row-bg: #f4f4f4;                 /* --cds-layer-01 (Carbon $layer) */
  --cds-file-uploader-row-text: #161616;               /* --cds-text-primary */
  --cds-file-uploader-row-divider: #c6c6c6;            /* --cds-border-subtle (used between filename + form-requirement on invalid) */

  /* Status icons */
  --cds-file-uploader-loading-stroke: #161616;         /* --cds-icon-primary */
  --cds-file-uploader-complete-fill: #0f62fe;          /* --cds-interactive */
  --cds-file-uploader-complete-inner: #ffffff;         /* --cds-icon-inverse */
  --cds-file-uploader-close-fill: #161616;             /* --cds-icon-primary */
  --cds-file-uploader-error-fill: #da1e28;             /* --cds-support-error */

  /* Invalid form-requirement */
  --cds-file-uploader-invalid-title: #da1e28;          /* --cds-text-error */
  --cds-file-uploader-invalid-supplement: #161616;     /* --cds-text-primary */
  --cds-file-uploader-invalid-outline: #da1e28;        /* --cds-support-error */
}

[data-theme="g100"],
.dark {
  /* Drop container */
  --cds-file-uploader-drop-bg: transparent;            /* over --cds-background #161616 */
  --cds-file-uploader-drop-border: #6f6f6f;            /* --cds-border-strong-01 */
  --cds-file-uploader-drop-border-disabled: rgba(141, 141, 141, 0.3); /* --cds-button-disabled (G100) */
  --cds-file-uploader-drop-focus: #ffffff;             /* --cds-focus (G100) */

  /* Browse-link button */
  --cds-file-uploader-browse-color: #78a9ff;           /* --cds-link-primary (G100) */
  --cds-file-uploader-browse-active-color: #f4f4f4;    /* --cds-text-primary (G100) */
  --cds-file-uploader-browse-disabled-color: rgba(244, 244, 244, 0.25); /* --cds-text-disabled (G100) */

  /* Label / helper */
  --cds-file-uploader-label-color: #f4f4f4;            /* --cds-text-primary */
  --cds-file-uploader-label-disabled: rgba(244, 244, 244, 0.25);
  --cds-file-uploader-helper-color: #c6c6c6;           /* --cds-text-secondary */
  --cds-file-uploader-helper-disabled: rgba(244, 244, 244, 0.25);

  /* Selected file row */
  --cds-file-uploader-row-bg: #262626;                 /* --cds-layer-01 (G100) */
  --cds-file-uploader-row-text: #f4f4f4;               /* --cds-text-primary */
  --cds-file-uploader-row-divider: #525252;            /* --cds-border-subtle-01 */

  /* Status icons */
  --cds-file-uploader-loading-stroke: #f4f4f4;         /* --cds-icon-primary */
  --cds-file-uploader-complete-fill: #4589ff;          /* --cds-interactive (G100) */
  --cds-file-uploader-complete-inner: #161616;         /* --cds-icon-inverse (G100) */
  --cds-file-uploader-close-fill: #f4f4f4;             /* --cds-icon-primary */
  --cds-file-uploader-error-fill: #fa4d56;             /* --cds-support-error (G100) */

  /* Invalid form-requirement */
  --cds-file-uploader-invalid-title: #ff8389;          /* --cds-text-error (G100) */
  --cds-file-uploader-invalid-supplement: #f4f4f4;     /* --cds-text-primary */
  --cds-file-uploader-invalid-outline: #fa4d56;        /* --cds-support-error (G100) */
}
```

## States Reference (from `_file-uploader.scss`)

> Pulled verbatim from `https://raw.githubusercontent.com/carbon-design-system/carbon/main/packages/styles/scss/components/file-uploader/_file-uploader.scss`. Hex values are the resolved White / G100 equivalents — see the Design Tokens section above for token names.

### Drop container (`.cds--file__drop-container`)

| State | Background | Border | Outline | Other |
|---|---|---|---|---|
| Rest | none | `1px dashed var(--cds-border-strong)` (`#8d8d8d` / `#6f6f6f`) | — | `block-size: 96px`; `padding: 16px`; `display: flex; align-items: flex-start; justify-content: space-between; overflow: hidden`; `body-compact-01` type |
| Hover | (rest) | (rest) | — | Pointer cursor inherited from `.cds--file-browse-btn` |
| Drag-over (`.cds--file__drop-container--drag-over`) | `none` (explicit `background: none`) | (rest) | `2px solid var(--cds-focus)` (`#0f62fe` / `#ffffff`); `outline-offset: -2px` | — |
| Disabled (parent has `.cds--file-browse-btn--disabled`) | (rest) | `1px dashed var(--cds-button-disabled)` (`#c6c6c6` / `rgba(141,141,141,0.3)`) | none | `cursor: no-drop`; no transition |
| Focus-visible (on parent `.cds--file-browse-btn`) | (rest) | (rest) | `2px solid var(--cds-focus)`; `outline-offset: -2px` | — |
| Windows HCM | — | — | `outline` via `high-contrast-mode('outline')` mixin | applied to `.cds--file__selected-file` |

Verbatim SCSS for the drop container:

```scss
.#{$prefix}--file__drop-container {
  @include button-reset.reset;
  @include type-style('body-compact-01');

  display: flex;
  overflow: hidden;
  align-items: flex-start;
  justify-content: space-between;
  padding: $spacing-05;
  border: 1px dashed $border-strong;
  block-size: convert.to-rem(96px);
}

.#{$prefix}--file__drop-container--drag-over {
  background: none;
  outline: 2px solid $focus;
  outline-offset: -2px;
}
```

### Browse-link button (`.cds--file-browse-btn`)

| State | Color | Outline | Text-decoration | Cursor |
|---|---|---|---|---|
| Rest | `var(--cds-link-primary)` (`#0f62fe` / `#78a9ff`) | `2px solid transparent`; `outline-offset: -2px` | none | pointer |
| Hover | (rest) | `2px solid var(--cds-focus)` | underline | pointer |
| Focus | (rest) | `2px solid var(--cds-focus)` | underline | pointer |
| Active | `var(--cds-text-primary)` (`#161616` / `#f4f4f4`) | (rest) | underline | pointer |
| Active:visited | `var(--cds-text-primary)` | (rest) | underline | pointer |
| Disabled | `var(--cds-text-disabled)` | none | none | `no-drop` |
| Disabled hover | `var(--cds-text-disabled)` | none | none | `no-drop` |
| Disabled focus | `var(--cds-text-disabled)` | none | none | `no-drop` |

Transition (rest only; disabled clears it):

```scss
transition: $duration-fast-02 motion(standard, productive);
/* resolves to: 110ms cubic-bezier(0.2, 0, 0.38, 0.9) */
```

Verbatim SCSS for the browse-link button:

```scss
.#{$prefix}--file-browse-btn {
  display: inline-block;

  color: $link-primary;
  cursor: pointer;
  inline-size: 100%;
  max-inline-size: convert.to-rem(320px);
  outline: 2px solid transparent;
  outline-offset: -2px;
  transition: $duration-fast-02 motion(standard, productive);

  &:focus,
  &:hover {
    outline: 2px solid $focus;
  }

  &:hover,
  &:focus,
  &:active,
  &:active:visited {
    text-decoration: underline;
  }

  &:active {
    color: $text-primary;
  }
}

.#{$prefix}--file-browse-btn--disabled {
  color: $text-disabled;
  cursor: no-drop;
  text-decoration: none;
  transition: none;

  &:hover,
  &:focus {
    color: $text-disabled;
    outline: none;
    text-decoration: none;
  }
}
```

### Selected-file row (`.cds--file__selected-file`)

| Variant | min-block-size | gap | padding (invalid) |
|---|---|---|---|
| Default / lg | `48px` (`spacing-09`) | `12px 0` | `12px 0` |
| md (`.cds--file__selected-file--md`) | `40px` | `8px 0` (`spacing-03`) | `8px 0` |
| sm (`.cds--file__selected-file--sm`) | `32px` | `4px 0` (`spacing-02`) | `4px 0` (`spacing-02`) |

| State | Background | Outline | Other |
|---|---|---|---|
| Rest | `var(--cds-layer-01)` (`#f4f4f4` / `#262626`) | none | `display: grid`; `grid-template-columns: 1fr auto`; `max-inline-size: 320px`; `align-items: center`; `word-break: break-word` |
| Invalid wrapper (deprecated) | `var(--cds-layer-01)` | `1px solid var(--cds-support-error)`; `outline-offset: -1px` | — |
| Invalid (current) | (rest) | `1px solid var(--cds-support-error)`; `outline-offset: -1px` | `padding: 12px 0` (default), `8px 0` (md), `4px 0` (sm) |
| Invalid form-requirement (inline) | (rest) | (rest) | `border-block-start: 1px solid var(--cds-border-subtle)`; `padding-block-start: 16px` (default), `7px` (sm), `11px` (md) |

Verbatim SCSS for the row sizing + invalid states:

```scss
.#{$prefix}--file__selected-file {
  display: grid;
  align-items: center;
  background-color: $layer;
  gap: convert.to-rem(12px) 0;
  grid-auto-rows: auto;
  grid-template-columns: 1fr auto;
  margin-block-end: $spacing-03;
  max-inline-size: convert.to-rem(320px);
  min-block-size: $spacing-09;
  word-break: break-word;

  &:last-child {
    margin-block-end: 0;
  }
}

.#{$prefix}--file__selected-file--md {
  gap: $spacing-03 0;
  min-block-size: convert.to-rem(40px);
}

.#{$prefix}--file__selected-file--sm {
  gap: $spacing-02 0;
  min-block-size: convert.to-rem(32px);
}

.#{$prefix}--file__selected-file--invalid {
  @include focus-outline('invalid');

  padding: convert.to-rem(12px) 0;
}

.#{$prefix}--file__selected-file--invalid.#{$prefix}--file__selected-file--sm {
  padding: $spacing-02 0;
}

.#{$prefix}--file__selected-file--invalid.#{$prefix}--file__selected-file--md {
  padding: $spacing-03 0;
}

.#{$prefix}--file__selected-file--invalid .#{$prefix}--form-requirement {
  border-block-start: 1px solid $border-subtle;
  padding-block-start: $spacing-05;
}

.#{$prefix}--file__selected-file--invalid
  .#{$prefix}--form-requirement__title,
.#{$prefix}--file__selected-file--invalid
  .#{$prefix}--form-requirement__supplement {
  @include type-style('helper-text-01');

  padding: 0 $spacing-05;
}

.#{$prefix}--file__selected-file--invalid
  .#{$prefix}--form-requirement__title {
  color: $text-error;
}

.#{$prefix}--file__selected-file--invalid
  .#{$prefix}--form-requirement__supplement {
  color: $text-primary;
}
```

### Status-icon container (`.cds--file__state-container`)

| Element | Size | Fill / stroke | Focus |
|---|---|---|---|
| Container | `min-inline-size: 24px`; `padding-inline-end: 12px` | — | — |
| Loading SVG (`.cds--loading__svg`) | inherits | `stroke: var(--cds-icon-primary)` (`#161616` / `#f4f4f4`) | — |
| Loading button (`.cds--file-loading`) | `block-size: 16px`; `inline-size: 24px`; `padding: 4px` (`spacing-02`); transparent bg, no border | (loading svg above) | — |
| Complete checkmark (`.cds--file-complete`) | `inline-size: 24px` | `fill: var(--cds-interactive)` (`#0f62fe` / `#4589ff`); inner-path fill `var(--cds-icon-inverse)` | `@focus-outline('border')` — `1px solid var(--cds-focus)` |
| Invalid icon (`.cds--file-invalid`) | `block-size: 16px`; `inline-size: 16px`; `margin-inline-end: 8px` | `fill: var(--cds-support-error)` (`#da1e28` / `#fa4d56`) | — |
| Close button (`.cds--file-close`) | `block-size: 24px`; `inline-size: 24px`; transparent bg, no border, `padding: 0`, `cursor: pointer` | `fill: var(--cds-icon-primary)`; child `svg path { fill: var(--cds-icon-primary) }` | `@focus-outline('outline')` — `2px solid var(--cds-focus)`, `inset 0 0 0 1px var(--cds-background)` |
| Inline-loading animation | `margin-inline-end: -8px` (`-$spacing-03`) | — | — |

Verbatim SCSS for the icon container and child icons:

```scss
.#{$prefix}--file__state-container {
  display: flex;
  align-items: center;
  justify-content: center;
  min-inline-size: 1.5rem;
  padding-inline-end: convert.to-rem(12px);

  .#{$prefix}--loading__svg {
    stroke: $icon-primary;
  }
}

.#{$prefix}--file__state-container .#{$prefix}--file-loading {
  display: flex;
  align-items: center;
  justify-content: center;
  padding: $spacing-02;
  border: none;
  background-color: transparent;
  block-size: $spacing-05;
  inline-size: $spacing-06;
}

.#{$prefix}--file__state-container .#{$prefix}--file-complete {
  // TODO: Should this be $icon-interactive instead?
  fill: $interactive;
  inline-size: $spacing-06;

  &:focus {
    @include focus-outline('border');
  }

  // for checkmark contrast
  [data-icon-path='inner-path'] {
    fill: $icon-inverse;
    opacity: 1;
  }
}

.#{$prefix}--file__state-container .#{$prefix}--file-invalid {
  block-size: $spacing-05;
  fill: $support-error;
  inline-size: $spacing-05;
}

.#{$prefix}--file__state-container .#{$prefix}--file-close {
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 0;
  border: none;
  background-color: transparent;
  block-size: $spacing-06;
  cursor: pointer;
  fill: $icon-primary;
  inline-size: $spacing-06;

  &:focus {
    @include focus-outline('outline');
  }
}

.#{$prefix}--file__state-container .#{$prefix}--file-close svg path {
  fill: $icon-primary;
}

.#{$prefix}--file__state-container .#{$prefix}--inline-loading__animation {
  margin-inline-end: -$spacing-03;
}
```

### Filename text (`.cds--file-filename`, `.cds--file-filename-button`)

| Element | Size | Color | Truncation |
|---|---|---|---|
| Filename text | `body-compact-01`; `margin-inline-start: 16px` | inherits `--cds-text-primary` | `overflow: hidden; text-overflow: ellipsis; white-space: nowrap` |
| Filename container wrap | `max-inline-size: 17.5rem` (280px); `padding-inline-start: 16px`; `margin-block-start: 1px` | — | (limits the truncation viewport) |
| Filename container wrap (≤410px viewport) | `max-inline-size: 13.5rem` (216px) | — | — |
| Filename container wrap invalid | `max-inline-size: 15.5rem` (248px) | — | — |
| Filename button | `body-compact-01`; transparent bg, no border, no padding, `cursor: pointer`; `inline-size: -webkit-fill-available` | inherits | ellipsis truncation |
| Filename button focus | (above) | — | `outline: revert` (browser default) |

Verbatim SCSS for filename text and button:

```scss
.#{$prefix}--file-filename {
  @include type-style('body-compact-01');

  overflow: hidden;
  margin-inline-start: $spacing-05;
  text-overflow: ellipsis;
  white-space: nowrap;
}

.#{$prefix}--file-filename-container-wrap {
  margin-block-start: 1px;
  max-inline-size: 17.5rem;
  padding-inline-start: $spacing-05;
  @include breakpoint-down(410px) {
    max-inline-size: 13.5rem;
  }
}

.#{$prefix}--file-filename-container-wrap-invalid {
  max-inline-size: 15.5rem;

  .#{$prefix}--file-filename-tooltip {
    inline-size: -webkit-fill-available;
    padding-inline-start: $spacing-05;

    @-moz-document url-prefix() {
      inline-size: -moz-available;
    }
  }
}

.#{$prefix}--file-filename-button {
  @include type-style('body-compact-01');

  overflow: hidden;
  padding: 0;
  border: none;
  background: none;
  color: inherit;
  cursor: pointer;
  font: inherit;
  inline-size: -webkit-fill-available;
  outline: inherit;
  text-overflow: ellipsis;
  white-space: nowrap;

  @-moz-document url-prefix() {
    inline-size: -moz-available;
  }
}
.#{$prefix}--file-filename-button:focus {
  outline: revert;
}
```

### Label, helper, and container spacing

| Element | Color | Spacing | Type style |
|---|---|---|---|
| `.cds--file--label` (rest) | `var(--cds-text-primary)` | `margin-block-end: 8px` (`spacing-03`) | `heading-compact-01` |
| `.cds--file--label--disabled` | `var(--cds-text-disabled)` | (above) | (above) |
| `.cds--label-description` (rest) | `var(--cds-text-secondary)` | `margin-block-end: 16px` (`spacing-05`) | `body-compact-01` |
| `.cds--label-description--disabled` | `var(--cds-text-disabled)` | (above) | (above) |
| `.cds--file--invalid` | `fill: var(--cds-support-error)` | `margin-inline-end: 8px` (`spacing-03`) | — |
| `.cds--file-input` | — | — | `@visually-hidden` |
| `.cds--file` | — | `inline-size: 100%` | — |
| `.cds--file-container--drop` | — | `inline-size: 100%` | — |
| `.cds--file-btn` (deprecated) | — | `display: inline-flex; margin: 0; padding-inline-end: 64px` | — |
| `.cds--file-btn ~ .cds--file-container` (deprecated) | — | `margin-block-start: 24px` (`spacing-06`) | — |
| `.cds--btn ~ .cds--file-container` | — | `margin-block-start: 16px` (`spacing-05`) | — |
| `.cds--file .cds--file-container`, `.cds--file ~ .cds--file-container` | — | `margin-block-start: 8px` (`spacing-03`) | — |

Verbatim SCSS for label, helper, and container spacing:

```scss
.#{$prefix}--file {
  inline-size: 100%;
}

.#{$prefix}--file--invalid {
  fill: $support-error;
  margin-inline-end: $spacing-03;
}

// TODO: sync with type
.#{$prefix}--file--label {
  @include reset;
  @include type-style('heading-compact-01');

  color: $text-primary;
  margin-block-end: $spacing-03;
}

.#{$prefix}--file--label--disabled {
  color: $text-disabled;
}

.#{$prefix}--file-input {
  @include visually-hidden;
}

// This class is of old markup with "select file" button
// New code should use link-style "select file" UI (`.cds--file-browse-btn`)
// TODO: deprecate this block
.#{$prefix}--file-btn {
  display: inline-flex;
  margin: 0;
  padding-inline-end: convert.to-rem(64px);
}

.#{$prefix}--label-description {
  @include reset;
  @include type-style('body-compact-01');

  color: $text-secondary;
  margin-block-end: $spacing-05;
}

.#{$prefix}--label-description--disabled {
  color: $text-disabled;
}

.#{$prefix}--file-container--drop {
  inline-size: 100%;
}

// For backwards compatibility
.#{$prefix}--file-btn ~ .#{$prefix}--file-container {
  margin-block-start: $spacing-06;
}

.#{$prefix}--btn ~ .#{$prefix}--file-container {
  margin-block-start: $spacing-05;
}

.#{$prefix}--file .#{$prefix}--file-container,
.#{$prefix}--file ~ .#{$prefix}--file-container {
  margin-block-start: $spacing-03;
}
```

### Status flow (per Storybook example apps)

The wired-up examples (`stories/drop-container.js` and `stories/drag-and-drop-single.js`) define the canonical state machine — every Carbon FileUploader implementation should match it:

1. **Add files** (`onAddFiles` → `addedFiles`): each file becomes a row with `status: 'uploading'`, `iconDescription: 'Uploading'`, plus a `uuid` derived from `useId() + name + size`.
2. **Validate size** (`filesize > 512000` → ~500 KB threshold in the Storybook): mark `status: 'edit'`, `invalid: true`, `errorSubject: 'File size exceeds limit'`, `errorBody: '1 MB max file size. Select a new file and try again.'`.
3. **Validate type** (`invalidFileType`): mark `status: 'edit'`, `invalid: true`, `errorSubject: 'Invalid file type'`, `errorBody: '"<name>" does not have a valid file type.'`.
4. **Simulate upload** (`setTimeout` with `Math.random() * 1000` ms): set `status: 'complete'`, `iconDescription: 'Upload complete'`. The complete checkmark renders.
5. **Auto-revert to edit after 1s** (`setTimeout(...rand + 1000)`): set `status: 'edit'`, `iconDescription: 'Delete file'`. The close × renders so the user can remove the file.
6. **Delete** (`onDelete` → `clickedUuid`): filter the row out of state and `uploaderButton.current.focus()` to return focus to the drop zone.

For the single-file variant: when `file === undefined` the drop container renders; when `file` is set the row replaces it. Deleting the row sets `file` back to `undefined`, restoring the drop container.

## Animation & Motion

Carbon uses two motion calls in `_file-uploader.scss` — both apply only to the browse-link button (the `<a>` styling). The drop container, file rows, and status icons rely on instant state swaps (no transition), with motion supplied by the inline-loading spinner only.

```css
.cds--file-browse-btn {
  /* From SCSS: $duration-fast-02 motion(standard, productive) */
  transition: var(--cds-duration-fast-02) var(--cds-easing-productive-standard);
  /* resolves to: 110ms cubic-bezier(0.2, 0, 0.38, 0.9) */
}

.cds--file-browse-btn--disabled {
  transition: none;
}

@media (prefers-reduced-motion: reduce) {
  .cds--file-browse-btn {
    transition: none;
  }
}
```

The complete-status checkmark relies on Carbon's `inner-path` opacity trick (`opacity: 1` set in the `[data-icon-path='inner-path']` selector) — there is no entry animation, but the SVG inner-path is invisible by default in `@carbon/icons` and Carbon explicitly opts it back in for visual contrast.

The `<svg class="cds--loading__svg">` inside the upload-in-progress row uses Carbon's `loading` motion (defined in `loading.scss`, imported at the top of `_file-uploader.scss` via `@use '../loading'`): an indeterminate spinner that strokes at constant speed. The motion mixin is `motion(standard, productive)` — same easing as the browse-button transition.

## Accessibility (from Carbon's docs + source)

- **Native input is hidden, not removed**: the actual `<input type="file">` carries the `cds--file-input` class which applies the `@visually-hidden` mixin. It stays in the tab order and is screen-reader-readable; the browse button (or drop container) acts as its visible proxy via `<label for="...">`.
- **Drop container is a button, not a div**: the WC source emits `<cds-file-uploader-drop-container>` as a custom element, but the SCSS `@include button-reset.reset` confirms the underlying element resets browser button styles — meaning the rendered DOM has `role="button"` semantics and is keyboard-activatable with Space/Enter.
- **Drop container `aria-label` / `labelText`**: Carbon's React API requires `labelText` (e.g., `"Drag and drop files here or click to upload"`) — this becomes the accessible name of the button.
- **Drop container `accept` attribute**: `accept` accepts an array of MIME types or extensions (e.g., `['image/jpeg', 'image/png']` or `['.jpg', '.png']`). The component still allows files outside the list to be dropped; validation is the consumer's job (see the `invalidFileType` flag flow in the example apps above).
- **Per-row delete button** (`<button class="cds--file-close">`): always carry `aria-label` = `iconDescription` (defaults to `"Delete file"`). Focus returns to the drop container after delete (see `uploaderButton.current.focus()` in the example).
- **Per-row complete button** (`<button class="cds--file-complete">`): carries `aria-label` = `iconDescription` (typically `"Upload complete"`). Focus shows `1px solid var(--cds-focus)` border outline.
- **Status announcements**: status changes (`uploading` → `complete` → `edit`) should be announced via an `aria-live="polite"` region. Carbon does not include this region by default — wrap the file list in `<div aria-live="polite" aria-atomic="false">` if your app needs SR announcements.
- **Invalid-row announcement**: `<div class="cds--form-requirement">` containing `__title` + `__supplement` carries the inline error text. The `--cds-text-error` color provides redundancy with the support-error icon — color is not the only error indicator.
- **Keyboard activation**:
  - Tab to the drop container or browse button → Space / Enter opens native file picker.
  - Tab through rows → Space / Enter on close × removes the row; focus returns to the drop container.
  - Tab on complete-checkmark button is a focusable element but a no-op (informational).
- **Drag-and-drop has no keyboard equivalent by design** — the click-through to the file picker is the keyboard fallback. Always include the `"or click to upload"` phrasing in `labelText`.
- **High-contrast (Windows HCM) mode**: `.cds--file__selected-file` uses `@include high-contrast-mode('outline')` so the row outline becomes visible in HCM (otherwise the `--cds-layer-01` background disappears against the system canvas).
- **Touch target**: The default-size selected-file row is 48px tall (matches the WCAG 2.5.5 44×44 px minimum). The sm-size variant (`32px`) and md-size (`40px`) are below the recommended touch target — restrict `sm` / `md` to mouse-and-keyboard contexts only.

## Do / Don't

| Do | Don't |
|---|---|
| Output the Storybook code AS-IS for Carbon outputs — including the `<FileUploader>` parent wrapper that holds label, helper, button, and selected-file list | Don't render a bare `<FileUploaderDropContainer>` without the `<FileUploader>` parent — the parent owns the label, helper text, and `cds--file__container` margin-collapsing rules |
| Use the `cds--file-browse-btn` link-style "select file" UI (current Carbon pattern) | Don't use the `cds--file-btn` class — it's marked `// TODO: deprecate this block` in the SCSS source |
| Sharp corners (`border-radius: 0`) — drop container, rows, icons all square | Don't add `border-radius` to the drop container or file rows |
| Use `1px dashed var(--cds-border-strong)` for the rest border | Don't use `2px` or `solid` — dashed-1px is the load-bearing visual signal |
| Set drag-over state via `outline: 2px solid var(--cds-focus); outline-offset: -2px` | Don't change the `border` on drag-over — Carbon explicitly switches to `outline` and clears the background, so the dashed border still shows underneath |
| Use the four status modes: `uploading` (spinner), `complete` (filled checkmark), `edit` (close ×), and `invalid` (error icon + form-requirement) | Don't invent a fifth status — Carbon's API only models these four |
| Auto-revert `complete` → `edit` after 1 second (Storybook source uses `setTimeout(...rand + 1000)`) | Don't leave the complete checkmark visible permanently — the user can never remove the file once it's in `complete` state |
| Return focus to the drop container after delete (`uploaderButton.current.focus()` in the source) | Don't drop focus to the document body after delete — keyboard users get stranded |
| Use `--cds-layer-01` (`#f4f4f4` / `#262626`) for the selected-file row background — distinct from the page `--cds-background` so rows read as a list | Don't make rows transparent on the page — the row must register as a discrete container |
| Use the `cds--*` class names from the WC source (`cds--file__drop-container`, `cds--file__selected-file`, `cds--file__state-container`) | Don't invent your own classes — Carbon's CSS is keyed off these exact names |
| Wrap in `[data-theme="white"]` or `[data-theme="g100"]` (or use `.dark` for class-toggle dark mode) | Don't define your own theme classes |
| For multi-file: stack rows vertically with `margin-block-end: $spacing-03` (8px) between rows; last child clears the margin | Don't add a `border-bottom` divider between rows — Carbon uses background color + spacing only, no per-row separator line |
| Pair the drop container with a separate file-list container (`cds--file-container cds--file-container--drop`) below it | Don't render uploaded files inside the drop container — they live in a sibling list |
| Honor `prefers-reduced-motion: reduce` by clearing the browse-link `transition` | Don't animate the row enter/exit — Carbon does not, and adding motion creates a frame-budget hit on long lists |
| Use `body-compact-01` for the drop container's "Drag and drop files here..." label | Don't bump the type — this text is informational, not a heading |
| For `multiple={false}`: hide the drop container while a file is selected (`{file === undefined && <FileUploaderDropContainer />}`) so the user can't add a second file | Don't disable the drop container on single-file mode — Carbon hides it entirely (see `stories/drag-and-drop-single.js`) |
| Use `accept` to constrain file types in the OS picker (`['image/jpeg', 'image/png']` or `['.jpg', '.png']`) | Don't rely on `accept` for validation — drag-and-drop bypasses it; validate in `onAddFiles` (see `invalidFileType` flow) |
| Cap selected-file rows at `max-inline-size: 320px` (matches the SCSS `convert.to-rem(320px)`) | Don't let rows expand to fill the page width — Carbon caps them so the file list reads as a discrete control, not a content region |
| Truncate long filenames with ellipsis (`overflow: hidden; text-overflow: ellipsis; white-space: nowrap`) inside the 17.5rem (280px) `cds--file-filename-container-wrap` (or 13.5rem on viewports ≤410px, 15.5rem when invalid) | Don't wrap filenames to multiple lines — the row min-block-size assumes single-line text |
