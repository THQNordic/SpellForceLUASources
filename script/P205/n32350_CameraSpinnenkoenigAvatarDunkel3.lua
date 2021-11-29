-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 181.715561 , 443.555267 , 23.096878 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(9251);]] )
   Camera:MotionSpline_AddSplinePoint( 182.312439 , 444.357605 , 23.096878 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 182.106979 , 445.756805 , 23.096878 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 181.901520 , 447.156006 , 23.096878 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.585938 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
