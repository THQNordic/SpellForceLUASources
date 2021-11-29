-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 354.858368 , 316.076477 , 75.386215 , 9.900002 , [[Camera:ScriptSplineLookAtNpc(4364);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.8);]] )
   Camera:MotionSpline_AddSplinePoint( 349.241791 , 316.298706 , 75.586212 , 6.399996 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 343.829834 , 316.512878 , 75.576218 , 9.800001 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 338.026611 , 316.742432 , 75.576218 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.195313 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
