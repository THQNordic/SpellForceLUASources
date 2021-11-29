-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 201.242630 , 310.970795 , 23.522865 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(6626);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,2.5);]] )
   Camera:MotionSpline_AddSplinePoint( 201.242630 , 310.970795 , 23.522865 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 201.242630 , 310.970795 , 23.522865 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 201.242630 , 310.970795 , 23.522865 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( 0.273438 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
