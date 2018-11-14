<?php

// This is a single-line comment

# This is also a single-line comment

$x = 5 /* + 15 */ + 5;
echo $x;

$color = "red";
echo "My car is " . $color . "<br>";
echo "My house is " . $COLOR . "<br>";
echo "My boat is " . $coLOR . "<br>";

 /**
  * This is the summary for a DocBlock.
  *
  * This is the description for a DocBlock. This text may contain
  * multiple lines and even some _markdown_.

  * @author  Blorp Bloop <me@wat.com>
  */

use Wikimedia\Rdbms\IDatabase;

class ChangeTagsLogList extends ChangeTagsList {
  public function doQuery( $db ) {
    for ( $this->reset(); $this->current(); $this->next() ) {
      $item = $this->current();
      $status = ChangeTags::updateTagsWithChecks( $tagsToAdd, $tagsToRemove,
        null, null, $item->getId(), $params, $reason, $user );
      // Should only fail on second and subsequent times if the user trips
      // the rate limiter
      if ( !$status->isOK() ) {
        break;
      }
    }

    $ids = array_map( 'intval', $this->ids );
    $queryInfo = DatabaseLogEntry::getSelectQueryData();
    $queryInfo['conds'] += [ 'log_id' => $ids ];
    return $db->select(
      $queryInfo['tables'],
      $queryInfo['fields'],
      $queryInfo['conds'],
      __METHOD__,
      $queryInfo['options'],
      $queryInfo['join_conds']
    );
  }
}
?>
