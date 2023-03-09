import React from 'react';
import styles from './markdown.module.css';

const MarkdownLayout = ({ content }) => {
  return (
    <>
      <div
        className={styles['markdown']}
        dangerouslySetInnerHTML={{ __html: content }}
      />
    </>
  );
};

export default MarkdownLayout;
